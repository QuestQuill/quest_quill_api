class Api::V1::Users::UsersTokenController < ApplicationController
  def update
    user = User.find(params[:user])

    user.update_columns(token: params[:token], token_expiration: Time.now + 10.minutes)

    render json: UsersSerializer.user(user)
  end
end