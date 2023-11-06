require 'rails_helper'

RSpec.describe 'User Search', type: :request do
  before(:each) do
    load_test_data
  end
  it 'Happy Path Searches for User By UserName' do

    search_query = 'user1'

    get "/api/v1/users/search?query=#{search_query}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response).to be_an(Array)

    expect(json_response.length).to be >= 1

    expect(json_response[0]['username']).to eq('user1')
    expect(json_response[0]['email']).to eq('user1@example.com')
  end

  it 'Sad Path User name not found' do

    search_query = 'Bobby Brown'
    
    get "/api/v1/users/search?query=#{search_query}"

    expect(response).to have_http_status(:bad_request)


  end
end