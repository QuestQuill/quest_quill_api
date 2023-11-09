class Api::V1::QuestsController < ApplicationController
    def index
      render json: QuestSerializer.new(Quest.all)
    end
  
    def show
      render json: QuestSerializer.new(Quest.find(params[:id]))
    end
  
    def create
      poro = CreationFacade.new.new_quest(params[:message])
      quest_data = {
        name: poro.name,
        description: poro.description,
        goal: poro.goal,
        campaign_id: params[:campaign_id]
      }
  
      render json: QuestSerializer.new(Quest.create(quest_data))
    end

    def update
      quest = Quest.find(params[:id])
      if quest.update(quest_params)
        render json: QuestSerializer.new(quest)
      else
        render json: { errors: quest.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def upload_photo
      quest = Quest.find(params[:id])
      quest.quest_photo.attach(params[:quest_photo])
      render json: QuestSerializer.new(quest)
    end
  
    private
  
    def quest_params
      params.permit(:name, :description, :goal, :quest_photo)
    end
  end