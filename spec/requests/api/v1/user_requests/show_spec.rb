require 'rails_helper'

RSpec.describe 'User Show', type: :request do
  before(:each) do
    load_test_data
  end

  it 'Returns User By ID' do
    get "/api/v1/users/#{@user1.id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response['data']['id']).to eq(@user1.id.to_s)
    expect(json_response['data']['type']).to eq('user')
    expect(json_response['data']['attributes']['username']).to eq('user1')
    expect(json_response['data']['attributes']['email']).to eq('user1@example.com')
  end
end