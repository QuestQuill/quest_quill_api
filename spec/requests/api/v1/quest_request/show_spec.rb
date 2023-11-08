require 'rails_helper'

RSpec.describe "Quests API" do
  before :each do
    load_test_data
  end

  it "can get a single Quest" do
    get "/api/v1/users/#{@user1.id}/campaigns/#{@campaign1.id}/quests/#{@quest1.id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response['data']['id']).to eq(@quest1.id.to_s)
    expect(json_response['data']['type']).to eq('quest')

    expect(json_response['data']['attributes']['description']).to eq(@quest1.description)
    expect(json_response['data']['attributes']['goal']).to eq(@quest1.goal)
  end
end