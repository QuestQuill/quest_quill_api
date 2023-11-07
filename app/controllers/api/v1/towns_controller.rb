class Api::V1::TownsController < ApplicationController
  def index
    render json: Town.all
  end

  def show
    render json: Town.find(params[:id])
  end

  def create
    poro = CreationFacade.new.new_town(params[:message])
    town_data = {
      name: poro.name,
      description: poro.description,
      leadership: poro.leadership,
      shops: poro.shops,
      taverns: poro.taverns,
      campaign_id: params[:campaign_id]
    }

    render json: Town.create(town_data)
  end

  def update
    @town = Town.find(params[:id])
    if @town.update(town_params)
      render json: @town
    else
      render json: { errors: @town.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def upload_photo
    @town = Town.find(params[:id])
    @town.town_photo.attach(params[:town_photo])
    render json: @town
  end

  private

  def town_params
    params.permit(:name, :description, :leadership, :shops, :taverns, :campaign_id, :town_photo)
  end
end