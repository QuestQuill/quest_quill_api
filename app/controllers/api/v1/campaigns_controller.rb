class Api::V1::CampaignsController < ApplicationController
  def index
    render json: Campaign.all
  end

  def show
    render json: Campaign.find(params[:id])
  end

  def create
    render json: Campaign.create(campaign_params)
  end

  private

  def campaign_params
    params.permit(:name, :player_num, :user_id, themes: [])
  end
end