require 'rails_helper'

describe "Campaigns API" do
  it "sends a list of campaigns" do
    create_list(:campaign, 3)

    get '/api/v1/campaigns'

    expect(response).to be_successful
  end
end