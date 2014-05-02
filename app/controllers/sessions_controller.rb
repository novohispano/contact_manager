class SessionsController < ApplicationController
  def create
    data = request.env['omniauth.auth']
    user = User.from_auth(data)

    redirect_to root_path, notice: "Logged in as #{user}"
  end
end
