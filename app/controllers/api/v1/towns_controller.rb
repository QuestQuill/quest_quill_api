class Api::V1::TownsController < ApplicationController
  def index
    render json: Town.all
  end

  def show
    render json: Town.find(params[:id])
  end

  def create
    new_town = CreationFacade.new.new_town(params[:message])
  end
end