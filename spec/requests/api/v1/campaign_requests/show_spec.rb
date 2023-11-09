require 'rails_helper'

RSpec.describe 'Campaign Show', type: :request do
  before(:each) do
    load_test_data
  end
  it 'Returns Campaign By ID' do
    get "/api/v1/users/#{@user1.id}/campaigns/#{@campaign1.id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response['data']['id']).to eq(@campaign1.id.to_s)
    expect(json_response['data']['type']).to eq('campaign')
    expect(json_response['data']['attributes']['name']).to eq(@campaign1.name)
    expect(json_response['data']['attributes']['player_num']).to eq(@campaign1.player_num)
    expect(json_response['data']['attributes']['themes']).to eq(@campaign1.themes)
  end
end
