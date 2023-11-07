require 'rails_helper'

RSpec.describe "Campaign Creation" do
  before :each do
    load_test_data
  end

  it "can create a new Campaign" do
    campaign_params = ({
      name: "Once upon a time",
      player_num: 4,
      themes: ["Fantasy", "High-Magic"],
      user_id: @user1.id
    })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users/#{@user1.id}/campaigns", headers: headers, params: JSON.generate(campaign_params)

    new_campaign = Campaign.last

    expect(response).to be_successful

    expect(response).to have_http_status(:ok)
    expect(response.content_type).to eq('application/json; charset=utf-8')
    expect(new_campaign.name).to eq('Once upon a time')
    expect(new_campaign.player_num).to eq(4)
    expect(new_campaign.themes).to eq(["Fantasy", "High-Magic"])
  end
end