require 'rails_helper'

RSpec.describe "Towns API" do
  before :each do
    load_test_data
  end

  it "can get a list of all towns" do
    get "/api/v1/users/#{@user1.id}/campaigns/#{@campaign1.id}/towns"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)
    towns = @campaign1.towns

    expect(json_response['data']).to be_a(Array)
    expect(json_response['data'].size).to eq(towns.size) 

    json_response['data'].each_with_index do |town_data, index|
      expect(town_data['id']).to eq(towns[index].id.to_s)
      expect(town_data['type']).to eq('town')
      expect(town_data['attributes']['name']).to eq(towns[index].name)
      expect(town_data['attributes']['description']).to eq(towns[index].description)
      expect(town_data['attributes']['leadership']).to eq(towns[index].leadership)
      expect(town_data['attributes']['shops']).to eq(towns[index].shops)
      expect(town_data['attributes']['taverns']).to eq(towns[index].taverns)
    end
  end
end