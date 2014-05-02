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

    it 'can logout' do
      page.click_link 'Logout'
      expect(page.current_path).to eq(root_path)
      expect(page).not_to have_link('Logout', href: logout_path)
    end

    it 'does not have a login link' do
      expect(page).not_to have_link('Login', href: login_path)
    end
  end

  context 'when logged out' do
    before(:each) do
      visit root_path
    end

    it 'has a Login link' do
      expect(page).to have_link('Login', href: login_path)
    end

    it 'does not have a logout link' do
      expect(page).to_not have_link('Logout', href: logout_path)
    end
  end
end
