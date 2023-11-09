require "rails_helper"

RSpec.describe "Update User Token", type: :request do
  before(:each) do
    load_test_data
  end

  it "returns user with updated user token" do
    get "/api/v1/users/#{@user1.id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response[:data][:attributes][:token]).to eq(@user1.token)

    patch "/api/v1/users/update_token", params: {token: "12345", user: @user1.id}

    expect(response).to be_successful

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response[:data][:attributes][:token]).to eq("12345")
  end
end