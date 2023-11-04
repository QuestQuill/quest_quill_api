require 'rails_helper'

RSpec.describe 'Campaign Show', type: :request do
  before(:each) do
    load_test_data
  end
  it 'Returns Campaign By ID' do
    get "/api/v1/users/#{@user1.id}/campaigns/#{@campaign1.id}"

    campaign1 = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response['id']).to be_a(Integer)
    expect(json_response).to be_a(Hash)

    expect(json_response['name']).to eq('Campaign 1')
    expect(json_response['player_num']).to eq(5)
    expect(json_response['themes']).to eq('Fantasy')

  end
end
