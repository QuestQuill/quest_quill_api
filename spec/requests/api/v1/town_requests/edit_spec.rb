require 'rails_helper'

RSpec.describe "Edit a Town" do
  before :each do
    load_test_data
  end

  it "can edit the details of a town" do
    previous_name = @town1.name
    town_params = ({ 
                    name: "Big Town",
                    description: "its a town",
                    leadership: "a person or collection of them",
                    shops: "That one shop",
                    taverns: "Tavern1"
    })
    headers = {"CONTENT_TYPE" => "application/json"}
  
    patch "/api/v1/users/#{@user1.id}/campaigns/#{@campaign1.id}/towns/#{@town1.id}", headers: headers, params: JSON.generate(town_params)

    expect(response).to be_successful
    @town1.reload

    expect(previous_name).to eq("Dimsdale")
    expect(@town1.name).to eq("Big Town")
  end
end