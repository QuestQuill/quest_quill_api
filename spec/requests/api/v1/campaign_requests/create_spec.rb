require 'rails_helper'

RSpec.describe "Campaign Creation" do
  before :each do
    load_test_data
  end

  # Happy Path
  it "can create a new Campaign" do
    campaign_params = ({
      name: "Once upon a time",
      player_num: 4,
      user_id: @user1.id,
      theme_ids: [@theme1.id, @theme2.id, @theme3.id]
    })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users/#{@user1.id}/campaigns", headers: headers, params: JSON.generate(campaign_params)

    new_campaign = Campaign.last
    
    expect(response).to be_successful
    json_response = JSON.parse(response.body)

    expect(response).to have_http_status 201
    expect(response.content_type).to eq('application/json; charset=utf-8')
    expect(new_campaign.name).to eq('Once upon a time')
    expect(new_campaign.player_num).to eq(4)
    expect(new_campaign.user_id).to eq(@user1.id)
    expect(new_campaign.themes).to eq([@theme1, @theme2, @theme3])
  end

  # Sad Path (No campaign name)
  it "gives an error when given bad credentials" do
    campaign_params = ({
      player_num: 4,
      user_id: @user1.id,
      theme_ids: [@theme1.id, @theme2.id, @theme3.id]
    })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users/#{@user1.id}/campaigns", headers: headers, params: JSON.generate(campaign_params)
    34
    expect(response).to have_http_status 401

    json_response = JSON.parse(response.body)

    expect(json_response).to be_a Hash
    expect(json_response['error']).to eq("An error has occured while creating your campaign")
  end
end