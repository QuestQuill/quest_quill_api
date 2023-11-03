require 'rails_helper'

describe "Users API" do
  before (:each) do
    load_test_data
  end

  it "sends a list of Users" do
    get "/api/v1/users"

    expect(response).to be_successful

    users = JSON.parse(response.body)

    # add more robust testing!
  end

  it "can get a single User" do
    get "/api/v1/users/#{@users.first.id}"

    expect(response).to be_successful

    user = JSON.parse(response.body)

    # add more robust testing!
  end

  it "can create a new User" do
    user_params = ({
      username: "hiro_protagonist",
      email: "hiro@gmail.com",
      password: "password"
    })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

    new_user = User.last

    expect(response).to be_successful
    
    # add more robust testing!
  end
end