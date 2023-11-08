class Api::V1::Users::UsersGithubController < ApplicationController
  def create
    user = User.find_or_create_by(uid: params[:uid])
    user.username = params[:login]
    user.uid = params[:uid]
    user.auth_token = params[:access_token]
    user.password = "#{params[:uid]}#{params[:login]}#{params[:uid]}"
    user.email = params[:login]
    user.save!

    render json: UserSerializer.new(user)
  end
end