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

  it "can get a single town" do
    get "/api/v1/towns/#{@towns.first.id}"

    expect(response).to be_successful

    town = JSON.parse(response.body)

    # mroe testing here!
  end

  it "can create a new town" do
    town_params = ({
      name: "Fort Gulbrand",
      description: "An old Dwarven fortress resting at the foot of the mighty Muhlorand mountains. This fortress once was the primary Western outpost of a long extinct dwarven kingdom, but now is home to an assortment of races and characters. The cities high walls and impecable defenses make it a frequent stop for travels moving farther West to resupply and find refuge.",
      leadership: "Stoic the Vast",
      taverns: "The Seven Drunken Knights",
      shops: "Flight and Fancy: A local clothier who sometimes sells exceptional pieces of cloth magic items, anything from leather gloves, to silk scarves.",
      campaign_id: @campaigns.first.id
    })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/towns", headers: headers, params: JSON.generate(town: town_params)

    new_town = Town.last
    
    expect(response).to be_successful    
  end
end