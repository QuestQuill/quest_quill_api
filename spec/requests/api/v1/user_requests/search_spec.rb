require 'rails_helper'

RSpec.describe 'User Search', type: :request do
  before(:each) do
    load_test_data
  end
  it 'Happy Path Searches for User By email' do
    email_query = 'user1@example.com'

    get "/api/v1/users/search?email=#{email_query}"

    expect(response).to be_successful
    
    json_response = JSON.parse(response.body, symbolize_names: true)
    
    expect(json_response).to be_an(Hash)
    expect(json_response[:data]).to be_an(Array)

    expect(json_response[:data].length).to be >= 1

    expect(json_response[:data][0][:attributes][:username]).to eq('user1')
    expect(json_response[:data][0][:attributes][:email]).to eq('user1@example.com')
  end

  it 'happy path searches for user by token' do
    token_query = 'abcdefg'

    get "/api/v1/users/search?token=#{token_query}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body, symbolize_names: true)
        
    expect(json_response).to be_an(Hash)
    expect(json_response[:data]).to be_an(Array)

    expect(json_response[:data].length).to be >= 1

    expect(json_response[:data][0][:attributes][:username]).to eq('user1')
    expect(json_response[:data][0][:attributes][:email]).to eq('user1@example.com')
  end

  it 'Sad Path email not found' do

    email_query = 'Bobby Brown'
    
    get "/api/v1/users/search?email=#{email_query}"

    expect(response).to have_http_status(:bad_request)
  end

  it 'Sad Path token not found' do

    token_query = 'Bobby Brown'
    
    get "/api/v1/users/search?token=#{token_query}"

    expect(response).to have_http_status(:bad_request)
  end
end