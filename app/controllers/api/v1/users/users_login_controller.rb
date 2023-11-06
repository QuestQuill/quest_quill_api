class Api::V1::Users::UsersLoginController < ApplicationController
  def login
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      render json: { message: 'Login successful', user_id: user.id }, status: :ok
    else
      render json: { error: 'Authentication failed' }, status: :unauthorized
    end
  end

private
  def user_params
    params.permit(:username, :email, :password)
  end
end