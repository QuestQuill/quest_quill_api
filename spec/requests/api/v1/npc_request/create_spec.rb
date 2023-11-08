require 'rails_helper'

RSpec.describe "Create NPC API" do
  before :each do
    load_test_data
  end

  it "can create a new npc", :vcr do

    headers = {"CONTENT_TYPE" => "application/json"}
    params = {
      message: 
        "create a new fantasy npc with the following unique attributes:
        name:
        gender:
        race:
        klass:
        description:
        attitude:",
      campaign: @campaign1.id
    }

    post "/api/v1/users/#{@user1.id}/campaigns/#{@campaign1.id}/npcs", headers: headers, params: JSON.generate(params)

    new_npc = Npc.last

    expect(response).to be_successful   
    
    expect(new_npc.name).to be_a String
    expect(new_npc.gender).to be_a String
    expect(new_npc.race).to be_a String
    expect(new_npc.klass).to be_a String
    expect(new_npc.description).to be_a String
    expect(new_npc.attitude).to be_a String
  end
end