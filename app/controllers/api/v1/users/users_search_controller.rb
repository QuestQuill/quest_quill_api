class Api::V1::Users::UsersSearchController < ApplicationController
    def search
      username = User.search_by_username(params[:query])
      if username.present?
        render json: username
      else
        head :bad_request,  status: :bad_request
      end
    end

  private

  def user_params
    params.permit(:username, :email, :password)
  end
end