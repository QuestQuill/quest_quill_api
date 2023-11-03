class Api::V1::TownsController < ApplicationController
  def index
    render json: Town.all
  end

  def show
    render json: Town.find(params[:id])
  end

  def create
    render json: Town.create!(town_params)
  end

  private

  def town_params
    params.require(:town).permit(:name, :description, :leadership, :taverns, :shops, :campaign_id)
  end
end