require 'rails_helper'

RSpec.describe 'User Index', type: :request do
  before(:each) do
    load_test_data
  end
  it 'Returns All Users' do
    get "/api/v1/users"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)
    
    expect(json_response).to be_a(Array)
    expect(json_response.size).to eq(3) 
    expect(json_response).to all(have_key('username'))
    expect(json_response).to all(have_key('email'))
    expect(json_response).to all(have_key('password_digest'))
    
    expect(json_response[0]).to be_a(Hash)
    expect(json_response[0]['username']).to eq('user1')
    expect(json_response[0]['email']).to eq('user1@example.com')
    #expect(json_response[0]['password_digest']).to eq('password1')

    expect(json_response[1]).to be_a(Hash)
    expect(json_response[1]['username']).to eq('user2')
    expect(json_response[1]['email']).to eq('user2@example.com')
    #expect(json_response[0]['password_digest']).to eq('password2')

    expect(json_response[2]).to be_a(Hash)
    expect(json_response[2]['username']).to eq('user3')
    expect(json_response[2]['email']).to eq('user3@example.com')
    #expect(json_response[0]['password_digest']).to eq('password3')

  end
end