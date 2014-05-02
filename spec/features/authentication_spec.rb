require 'features/feature_spec_helper'

class FakeSessionsController < ApplicationController
  def create
    session[:user_id] = params[:user_id]
    redirect_to root_path
  end
end

describe 'the application', type: :feature do
  context 'when logged in' do
    before(:each) do
      Rails.application.routes.draw do
        root to: 'site#index'
        get '/fake_login' => 'fake_sessions#create',    as: :fake_login
        get '/login'      => redirect('/auth/twitter'), as: :login
        delete "/logout"  => "sessions#destroy",        as: :logout
      end
      user = User.create(name: 'Jane Doe')
      visit fake_login_path(:user_id => user.id)
    end

    after(:each) do
      Rails.application.reload_routes!
    end

    it 'has a logout link' do
      expect(page).to have_link('Logout', href: logout_path)
    end
  end

  context 'when logged in' do
    before(:each) do
      visit root_path
    end

    xit 'has a logout link' do
      expect(page).to have_link('Logout', href: logout_path)
    end
  end
end
