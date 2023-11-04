require 'rails_helper'

RSpec.describe "Towns API" do
  before :each do
    load_test_data
  end

  it "can get a list of all towns" do
    get "/api/v1/users/#{@users.first.id}/campaigns/#{@campaigns.first.id}/towns"

    expect(response).to be_successful

    towns = JSON.parse(response.body)

    # more testing here!
  end

  it "can get a single town" do
    get "/api/v1/users/#{@users.first.id}/campaigns/#{@campaigns.first.id}/towns/#{@towns.first.id}"

    expect(response).to be_successful

    town = JSON.parse(response.body)

    # mroe testing here!
  end

  it "can create a new town", :vcr do

    headers = {"CONTENT_TYPE" => "application/json"}
    params = {
      message: 
        "create a new fantasy town with the following unique attributes:
        name:
        description:
        leadership:
        shops:
        taverns:",
      campaign: @campaigns.first.id
    }


    post "/api/v1/users/#{@users.first.id}/campaigns/#{@campaigns.first.id}/towns", headers: headers, params: JSON.generate(params)

    new_town = Town.last

    expect(response).to be_successful   
    
    expect(new_town.name).to be_a String
    expect(new_town.description).to be_a String
    expect(new_town.leadership).to be_a String
    expect(new_town.shops).to be_a String
    expect(new_town.taverns).to be_a String
  end
end