require 'rails_helper'

RSpec.describe 'Campaign Show', type: :request do
  before(:each) do
    load_test_data
  end
  it 'Returns Campaign By ID' do
    get "/api/v1/users/#{@user1.id}/campaigns/#{@campaign1.id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

<<<<<<< HEAD
    expect(json_response['data']['id']).to eq(@campaign1.id.to_s)
    expect(json_response['data']['type']).to eq('campaign')
    expect(json_response['data']['attributes']['name']).to eq(@campaign1.name)
    expect(json_response['data']['attributes']['player_num']).to eq(@campaign1.player_num)
    expect(json_response['data']['attributes']['themes']).to eq(@campaign1.themes)
=======
    expect(json_response['id']).to be_a(Integer)
    expect(json_response).to be_a(Hash)

    expect(json_response['name']).to eq('Campaign 1')
    expect(json_response['player_num']).to eq(5)
    expect(json_response['themes'][0]).to eq('Fantasy')

>>>>>>> 578a9f60f3855c9c019fd189e121dadcf1316358
  end
end
