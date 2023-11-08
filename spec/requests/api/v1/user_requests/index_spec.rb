require 'rails_helper'

RSpec.describe 'User Index', type: :request do
  before(:each) do
    load_test_data
  end
  it 'Returns All Users' do
    get "/api/v1/users"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)
    users = User.all
    
    expect(json_response['data']).to be_a(Array)
    expect(json_response['data'].size).to eq(users.size)

    json_response['data'].each_with_index do |user_data, index|
      expect(user_data['id']).to eq(users[index].id.to_s)
      expect(user_data['type']).to eq('user')
      expect(user_data['attributes']['username']).to eq(users[index].username)
      expect(user_data['attributes']['email']).to eq(users[index].email)
    end
  end
end