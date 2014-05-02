require 'spec_helper'

describe SessionsController do
  # before(:each) do
  #   Rails.application.routes.draw do
  #     resource :sessions, only: [:create]
  #   end
  # end

  describe "#create" do
    it "it logs in a new user" do
      @request.env["omniauth.auth"] = {
        'provider' => 'twitter',
        'info' => {'name' => 'Alice Smith'},
        'uid' => 'abc123'
      }

      post :create, {}, { user_id: 1 }
      user = User.find_by(uid: 'abc123', provider: 'twitter')
      expect(user.provider).to eq('twitter')
      expect(user.uid).to eq('abc123')
      expect(user.name).to eq("Alice Smith")
      expect(controller.current_user.id).to eq(user.id)
      expect(response).to redirect_to(root_path)
    end

    it "it logs in an existing user" do
      user = User.create(provider: 'twitter', uid: 'xyz456', name: 'Bob Jones')

      @request.env["omniauth.auth"] = {
        'provider' => 'twitter',
        'info' => {'name' => 'Bob Jones'},
        'uid' => 'xyz456'
      }

      post :create, {}, { user_id: user.id }
      expect(User.count).to eq(1)
      expect(controller.current_user.id).to eq(user.id)
      expect(response).to redirect_to(root_path)
    end
  end
end
