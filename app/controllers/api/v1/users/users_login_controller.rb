class Api::V1::Users::UsersLoginController < ApplicationController
  def login
    user = User.find_by(email: user_params[:email])
    if user
      if user.authenticate(user_params[:password])
        render json: { message: 'Login successful', user_id: user.id }, status: :ok
      else
        render json: { error: 'Authentication failed' }, status: :unauthorized
      end
    else
      render json: { error: 'Authentication failed' }, status: :unauthorized
    end
  end

private
  def user_params
    params.permit(:username, :email, :password)
  end
end