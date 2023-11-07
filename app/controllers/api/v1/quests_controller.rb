class Api::V1::QuestsController < ApplicationController
    def index
      render json: Quest.all
    end
  
    def show
      render json: Quest.find(params[:id])
    end
  
    def create
      poro = CreationFacade.new.new_quest(params[:message])
      quest_data = {
        name: poro.name,
        description: poro.description,
        goal: poro.goal,
        campaign_id: params[:campaign_id]
      }
  
      render json: Quest.create(quest_data)
    end
  end