class Api::V1::CampaignsController < ApplicationController
  def index
    render json: CampaignSerializer.new(Campaign.all)
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
    render json: CampaignSerializer.new(Campaign.find(params[:id]))
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