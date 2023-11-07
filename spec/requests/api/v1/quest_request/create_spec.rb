require 'rails_helper'

RSpec.describe "Quests API" do
  before :each do
    load_test_data
  end

  it "can create a new npc", :vcr do

    headers = {"CONTENT_TYPE" => "application/json"}
    params = {
      message: 
        "create a new fantasy quest with the following unique attributes keep it short:
        name:
        description:
        goal:",
      campaign: @campaign1.id
    }


    post "/api/v1/users/#{@user1.id}/campaigns/#{@campaign1.id}/quests", headers: headers, params: JSON.generate(params)

    new_quest = Quest.last

    expect(response).to be_successful   
    
    expect(new_quest.name).to be_a String
    expect(new_quest.description).to be_a String
    expect(new_quest.goal).to be_a String
  end
end