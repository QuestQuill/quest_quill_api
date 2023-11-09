class Api::V1::UsersController < ApplicationController
  def index
    render json: UserSerializer.new(User.all)
  end

  def show
    render json: UserSerializer.new(User.find(params[:id]))
  end

  def create
    render json: UserSerializer.new(User.create!(user_params))
  end

  def upload_photo
    @user = User.find(params[:id])
    @user.user_photo.attach(params[:user_photo])
    @user.user_photo.save
    render json: UserSerializer.new(@user)
  end

  private

  def user_params
    params.permit(:username, :email, :password, :user_photo)
  end
end