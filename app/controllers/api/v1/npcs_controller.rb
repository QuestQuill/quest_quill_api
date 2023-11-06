class Api::V1::NpcsController < ApplicationController
    def index
        render json: Npc.all
    end

    def show
        render json: Npc.find(params[:id])
    end

    def create
        poro = CreationFacade.new.new_npc(params[:message])
        npc_data = {
            name: poro.name,
            gender: poro.gender,
            race: poro.race,
            klass: poro.class,
            description: poro.description,
            attitude: poro.attitude,
            campaign_id: params[:campaign_id]
        }

        render json: Npc.create(npc_data)
    end
end