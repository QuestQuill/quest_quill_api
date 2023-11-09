class Api::V1::CampaignsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    campaigns = user.campaigns
    render json: CampaignSerializer.new(campaigns)
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
    render json: CampaignSerializer.new(Campaign.create(campaign_params))
  end
  
  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update(campaign_params)
      render json: CampaignSerializer.new(@campaign)
    else
      render json: { errors: @campaign.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def upload_photo
    @campaign = Campaign.find(params[:id])
    @campaign.campaign_photo.attach(params[:campaign_photo])
    render json: CampaignSerializer.new(@campaign)
  end

  private 

  def campaign_params
    params.permit(:name, :player_num, :user_id, :campaign_photo, themes: [])
  end
end