require 'rails_helper'

RSpec.describe 'Create Campaign' do
  before :each do
    load_test_data
  end

  it "Can Create a new campaign" do    
    campaign_params = ({
      name: "One Hungry Boi",
      player_num: 4,
      themes: "spooky",
      user: @user1.id
    })
    headers = {"CONTENT_TYPE" => "application/json"}
    
    post "/api/v1/users/#{@user1.id}/campaigns"

    new_campaign = Campagin.last

    expect(new_campaign.name).to eq("One Hungry Boi")
    expect(new_campaign.player_num).to eq(4)
    expect(new_campaign.themes).to eq("spooky")
    expect(new_campaign.user).to eq(@user1.id)
  end
end