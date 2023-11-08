require "rails_helper"

RSpec.describe "Github Auth", type: :request do
  it "returns user created by github auth" do
    user_data = {
      uid: 97274592,
      login: "mylogin",
      access_token: "hdksikaskfdj"
    }

    post "/api/v1/users/auth", params: user_data

    expect(response).to be_successful

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user[:data]).to be_a(Hash)
    
    expect(user[:data][:attributes][:uid]).to eq(user_data[:uid].to_s)
    expect(user[:data][:attributes][:username]).to eq(user_data[:login])
    expect(user[:data][:attributes][:auth_token]).to eq(user_data[:access_token])
  end
end