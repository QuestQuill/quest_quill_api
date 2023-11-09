class Api::V1::NpcsController < ApplicationController
    def index
        campaign = Campaign.find(params[:campaign_id])
        npcs = campaign.npcs
        render json: NpcSerializer.new(npcs)
    end

    def show
        render json: NpcSerializer.new(Npc.find(params[:id]))
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

        render json: NpcSerializer.new(Npc.create(npc_data))
    end

    def update
        @npc = Npc.find(params[:id])
        if @npc.update(npc_params)
           render json: NpcSerializer.new(@npc)
        else
            render json: { errors: @npc.errors.full_messages }, status: :unprocessable_entity
        end
    end
    
    def upload_photo
        @npc = Npc.find(params[:id])
        @npc.npc_photo.attach(params[:npc_photo])
        render json: NpcSerializer.new(@npc)
    end
    
    private
    
    def npc_params
        params.permit(:name, :gender, :race, :klass, :description, :attitude, :campaign_id, :npc_photo)
    end
end