require 'rails_helper'

RSpec.describe "Towns API" do
  before :each do
    load_test_data
  end

  it "can get a single town" do
    get "/api/v1/users/#{@user1.id}/campaigns/#{@campaign1.id}/towns/#{@town1.id}"

    expect(response).to be_successful

    town = JSON.parse(response.body)

    expect(town['data']['id']).to eq(@town1.id.to_s)
    expect(town['data']['type']).to eq('town')

    expect(town['data']['attributes']['name']).to eq('Dimsdale')
    expect(town['data']['attributes']['description']).to eq("A quaint little town...")
    expect(town['data']['attributes']['leadership']).to eq("The mayor of Dimsdale")
    expect(town['data']['attributes']['taverns']).to eq("the armoured duck")
    expect(town['data']['attributes']['shops']).to eq("A hair solon")
  end
end