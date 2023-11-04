require 'rails_helper'

describe "Campaigns API" do
  before (:each) do
    load_test_data
  end

  it "sends a list of campaigns" do
    get "/api/v1/users/#{@users.first.id}/campaigns"

    expect(response).to be_successful

    campaigns = JSON.parse(response.body)
    
    # add more robust testing!
  end

  it "can get a single Campaign" do
    get "/api/v1/users/#{@users.first.id}/campaigns/#{@campaigns.first.id}"

    campaign = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    # add more robust testing!
  end

  it "can create a new Campaign" do
    campaign_params = {
      name: "Once upon a time",
      themes: "Fantasy",
      player_num: 4,
      user: @users.first.id
    }
    
    post "/api/v1/users/#{@users.first.id}/campaigns", params: campaign_params

    new_campaign = Campaign.last

    expect(new_campaign.name).to eq("Once upon a time")
    expect(new_campaign.themes).to eq("Fantasy")
    expect(new_campaign.player_num).to eq 4
    expect(new_campaign.user_id).to eq(@users.first.id)
  end
end