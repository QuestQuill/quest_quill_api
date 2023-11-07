require 'rails_helper'

RSpec.describe "Quests API" do
  before :each do
    load_test_data
  end

  it "can get a single town" do
    get "/api/v1/users/#{@user1.id}/campaigns/#{@campaign1.id}/quests/#{@quest1.id}"

    expect(response).to be_successful

    npc = JSON.parse(response.body)

    expect(npc['id']).to be_a(Integer)
    expect(npc).to be_a(Hash)
  end
end