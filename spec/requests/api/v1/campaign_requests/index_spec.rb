require 'rails_helper'

RSpec.describe 'Campaign Index', type: :request do
  before(:each) do
    load_test_data
  end
  it 'Returns All Campaigns' do
    get "/api/v1/users/#{@user1.id}/campaigns"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)
    campaigns = @user1.campaigns
    
    expect(json_response['data']).to be_a(Array)
    expect(json_response['data'].size).to eq(campaigns.size) 

    json_response['data'].each_with_index do |campaign_data, index|
      expect(campaign_data['id']).to eq(campaigns[index].id.to_s)
      expect(campaign_data['type']).to eq('campaign')
      expect(campaign_data['attributes']['name']).to eq(campaigns[index].name)
      expect(campaign_data['attributes']['player_num']).to eq(campaigns[index].player_num)
    end
  end
end