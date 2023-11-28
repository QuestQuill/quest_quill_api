class Api::V1::CampaignsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    campaigns = user.campaigns
    render json: CampaignSerializer.new(campaigns)
  end

  def show
    render json: CampaignSerializer.new(Campaign.find(params[:id]))
  end


  def create
    themes = find_themes(campaign_params) 
    campaign = Campaign.new(campaign_params)

    if campaign.save
      render json: CampaignSerializer.new(campaign), status: 201
    else
      render json: { error: "An error has occured while creating your campaign" }, status: 401
    end
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
    params.permit(:name, :player_num, :user_id, :campaign_photo, theme_ids: [])
  end

  def find_themes(parameters)
    theme_ids = parameters[:theme_ids]
    themes_by_id = theme_ids.map do |theme_id|
      Theme.find(theme_id)
    end
    themes_by_id.map do |theme|
      theme.name
    end
  end 
end