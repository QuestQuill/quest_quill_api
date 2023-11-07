require 'rails_helper'

RSpec.describe 'Campaign Index', type: :request do
  before(:each) do
    load_test_data
  end
  it 'Returns All Campaigns' do
    get "/api/v1/users/#{@user1.id}/campaigns"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)
    
    expect(json_response).to be_a(Array)
    expect(json_response.size).to eq(3) 
    expect(json_response).to all(have_key('name'))
    expect(json_response).to all(have_key('player_num'))
    expect(json_response).to all(have_key('themes'))
    
    expect(json_response[0]).to be_a(Hash)
    expect(json_response[0]['name']).to eq('Campaign 1')
    expect(json_response[0]['player_num']).to eq(5)
    expect(json_response[0]['themes'][0]).to eq('Fantasy')
  end
end