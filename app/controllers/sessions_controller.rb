class SessionsController < ApplicationController
  def create
    data = request.env['omniauth.auth']
    user = User.find_or_create_by(
      provider: data['provider'],
      uid: data['uid'],
      name: data['info']['name']
    )

    render nothing: true
  end
end
