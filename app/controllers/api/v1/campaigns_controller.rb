class Api::V1::CampaignsController < ApplicationController
  def index
    render json: Campaign.all
  end
end