class SessionsController < ApplicationController
  def create
    data = request.env['omniauth.auth']
    User.from_auth(data)

    redirect_to root_path
  end
end
