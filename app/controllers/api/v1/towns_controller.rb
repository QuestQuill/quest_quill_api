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
end