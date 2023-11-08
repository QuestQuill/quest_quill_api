class Api::V1::Users::UsersSearchController < ApplicationController
    def search
      if params[:email]
        user = User.search_by_email(user_params[:email])
      elsif params[:token]
        user = User.search_by_token(user_params[:token])
      end

      if !user.empty?
        render json: user
      else
        head :bad_request, status: :bad_request
      end
    end

  private

  def user_params
    params.permit(:email, :token)
  end
end