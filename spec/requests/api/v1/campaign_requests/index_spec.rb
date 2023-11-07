require 'rails_helper'

RSpec.describe 'Campaign Index', type: :request do
  before(:each) do
    load_test_data
  end
  it 'Returns All Campaigns' do
    get "/api/v1/users/#{@user1.id}/campaigns"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)
    campaigns = Campaign.all
    
<<<<<<< HEAD
    expect(json_response['data']).to be_a(Array)
    expect(json_response['data'].size).to eq(campaigns.size) 

    json_response['data'].each_with_index do |campaign_data, index|
      expect(campaign_data['id']).to eq(campaigns[index].id.to_s)
      expect(campaign_data['type']).to eq('campaign')
      expect(campaign_data['attributes']['name']).to eq(campaigns[index].name)
      expect(campaign_data['attributes']['player_num']).to eq(campaigns[index].player_num)
      expect(campaign_data['attributes']['themes']).to eq(campaigns[index].themes)
    end
=======
    expect(json_response).to be_a(Array)
    expect(json_response.size).to eq(3) 
    expect(json_response).to all(have_key('name'))
    expect(json_response).to all(have_key('player_num'))
    expect(json_response).to all(have_key('themes'))
    
    expect(json_response[0]).to be_a(Hash)
    expect(json_response[0]['name']).to eq('Campaign 1')
    expect(json_response[0]['player_num']).to eq(5)
    expect(json_response[0]['themes'][0]).to eq('Fantasy')
>>>>>>> 578a9f60f3855c9c019fd189e121dadcf1316358
  end
end