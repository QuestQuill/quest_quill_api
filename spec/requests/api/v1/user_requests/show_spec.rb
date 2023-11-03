require 'rails_helper'

RSpec.describe 'User Show', type: :request do
  before(:each) do
    load_test_data
  end
  it 'Returns User By ID' do
    get "/api/v1/users/#{@user1.id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response['id']).to be_a(Integer)
    expect(json_response).to be_a(Hash)

    expect(json_response['username']).to eq('user1')
    expect(json_response['email']).to eq('user1@example.com')
  end
end