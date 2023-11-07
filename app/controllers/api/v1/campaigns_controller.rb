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
  
  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update(campaign_params)
      render json: @campaign
    else
      render json: { errors: @campaign.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def upload_photo
    @campaign = Campaign.find(params[:id])
    @campaign.campaign_photo.attach(params[:campaign_photo])
    render json: @campaign
  end

  private 

  def campaign_params
    params.permit(:name, :player_num, :themes, :user_id, :campaign_photo)
  end
end