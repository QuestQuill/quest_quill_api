class Api::V1::CampaignsController < ApplicationController
  def index
    render json: Campaign.all
  end

  def show
    begin
      campaign = Campaign.find(params[:id])
      render json: campaign
    rescue ActiveRecord::RecordNotFound
      render status: 404
    end
  end

  def create
    if campaign_params[:name].nil? || campaign_params[:player_num].nil? || campaign_params[:themes].nil?
      render status: 422
    else
      render json: Campaign.create(campaign_params), status: 200
    end
  end

  private

  def campaign_params
    params.permit(:name, :player_num, :user_id, themes: [])
  end
end