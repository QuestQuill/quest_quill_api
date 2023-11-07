require 'rails_helper'

RSpec.describe "Quests API" do
  before :each do
    load_test_data
  end

  it "can get a list of all towns" do
    get "/api/v1/users/#{@user1.id}/campaigns/#{@campaign1.id}/quests"

    expect(response).to be_successful

    quests = JSON.parse(response.body)

    expect(quests).to be_a(Array)
    expect(quests.size).to eq(3) 
    expect(quests).to all(have_key('name'))
    expect(quests).to all(have_key('description'))
    expect(quests).to all(have_key('goal'))
    
    expect(quests[0]).to be_a(Hash)
    expect(quests[0]['name']).to eq('Rescue the Lost Heir')
    expect(quests[0]['description']).to eq("The lost heir of the kingdom has been kidnapped by a group of nefarious bandits. The kingdom is in turmoil, and it's up to the adventurers to rescue the heir and bring peace back to the realm.")
    expect(quests[0]['goal']).to eq("Locate the bandit's hideout, defeat the bandit leader, and safely return the heir to the royal palace.")
  end
end