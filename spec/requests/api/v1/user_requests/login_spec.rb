require 'rails_helper'

RSpec.describe 'User Login', type: :request do
  before(:each) do
    load_test_data
  end
  it 'Happy Path Login by email and password' do

    user_params = {
      email: 'user1@example.com',
      password: 'password1'
    }

    post '/api/v1/users/login', params: user_params

    expect(response).to have_http_status(:ok)

  end

  it 'Sad Path Login by email and password wrong info' do
    user_params = {
      email: 'user1@example.com',
      password: 'wrong_password'
    }

    post '/api/v1/users/login', params: user_params

    expect(response).to have_http_status(:unauthorized)
  end

  it "sad path login by email that doesn't exist" do
    user_params = {
      email: "wrongemail@example.com",
      password: "1234"
    }

    post "/api/v1/users/login", params: user_params

    expect(response).to have_http_status(:unauthorized)
  end
end