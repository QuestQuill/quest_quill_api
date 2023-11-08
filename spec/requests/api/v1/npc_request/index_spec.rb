require 'rails_helper'

RSpec.describe "NPCs API" do
  before :each do
    load_test_data
  end

  it "can get a list of all NPCs" do
    get "/api/v1/users/#{@user1.id}/campaigns/#{@campaign1.id}/npcs"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)
    npcs = Npc.all

    expect(json_response['data']).to be_a(Array)
    expect(json_response['data'].size).to eq(npcs.size) 

    json_response['data'].each_with_index do |npc_data, index|
      expect(npc_data['id']).to eq(npcs[index].id.to_s)
      expect(npc_data['type']).to eq('npc')
      expect(npc_data['attributes']['name']).to eq(npcs[index].name)
      expect(npc_data['attributes']['description']).to eq(npcs[index].description)
      expect(npc_data['attributes']['gender']).to eq(npcs[index].gender)
      expect(npc_data['attributes']['race']).to eq(npcs[index].race)
      expect(npc_data['attributes']['klass']).to eq(npcs[index].klass)
      expect(npc_data['attributes']['attitude']).to eq(npcs[index].attitude)
    end
  end
end