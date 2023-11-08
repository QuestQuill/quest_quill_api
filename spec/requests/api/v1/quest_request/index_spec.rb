require 'rails_helper'

RSpec.describe "Quests API" do
  before :each do
    load_test_data
  end

  it "can get a list of all Quests" do
    get "/api/v1/users/#{@user1.id}/campaigns/#{@campaign1.id}/quests"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)
    quests = Quest.all

    expect(json_response['data']).to be_a(Array)
    expect(json_response['data'].size).to eq(quests.size)

    json_response['data'].each_with_index do |quest_data, index|
      expect(quest_data['id']).to eq(quests[index].id.to_s)
      expect(quest_data['type']).to eq('quest')
      expect(quest_data['attributes']['name']).to eq(quests[index].name)        
      expect(quest_data['attributes']['description']).to eq(quests[index].description)        
      expect(quest_data['attributes']['goal']).to eq(quests[index].goal)        
    end
  end
end