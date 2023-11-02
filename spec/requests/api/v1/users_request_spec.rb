require 'rails_helper'

describe "Users API" do
  before (:each) do
    load_test_data
  end

  it "sends a list of Users" do
    get "/api/v1/users"

    expect(response).to be_successful
  end
end