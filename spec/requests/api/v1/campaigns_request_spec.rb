require 'rails_helper'

describe "Campaigns API" do
  before (:each) do
    load_test_data
  end

  it "sends a list of campaigns" do
    get '/api/v1/campaigns'

    expect(response).to be_successful

    campaigns = JSON.parse(response.body)
    
    # add more robust testing!
  end

  it "can get a single Campaign" do
    get "/api/v1/campaigns/#{@campaign1.id}"

    campaign = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    # add more robust testing!
  end
end