require 'rails_helper'

RSpec.describe "Towns API" do
  before :each do
    load_test_data
  end

  it "can get a list of all towns" do
    get '/api/v1/towns'

    expect(response).to be_successful

    towns = JSON.parse(response.body)

    # more testing here!
  end
end