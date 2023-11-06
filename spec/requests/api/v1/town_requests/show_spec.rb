require 'rails_helper'

RSpec.describe "Towns API" do
  before :each do
    load_test_data
  end

  it "can get a single town" do
    get "/api/v1/users/#{@user1.id}/campaigns/#{@campaign1.id}/towns/#{@town1.id}"

    expect(response).to be_successful

    town = JSON.parse(response.body)

    expect(town['id']).to be_a(Integer)
    expect(town).to be_a(Hash)

    expect(town['name']).to eq('Dimsdale')
    expect(town['description']).to eq("A quaint little town...")
    expect(town['leadership']).to eq("The mayor of Dimsdale")
    expect(town['taverns']).to eq("the armoured duck")
    expect(town['shops']).to eq("A hair solon")
  end
end