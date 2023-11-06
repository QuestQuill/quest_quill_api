require 'rails_helper'

RSpec.describe "Towns API" do
  before :each do
    load_test_data
  end

  it "can get a list of all towns" do
    get "/api/v1/users/#{@user1.id}/campaigns/#{@campaign1.id}/towns"

    expect(response).to be_successful

    towns = JSON.parse(response.body)

    expect(towns).to be_a(Array)
    expect(towns.size).to eq(3) 
    expect(towns).to all(have_key('name'))
    expect(towns).to all(have_key('description'))
    expect(towns).to all(have_key('leadership'))
    expect(towns).to all(have_key('taverns'))
    expect(towns).to all(have_key('shops'))
    
    expect(towns[0]).to be_a(Hash)
    expect(towns[0]['name']).to eq('Dimsdale')
    expect(towns[0]['description']).to eq("A quaint little town...")
    expect(towns[0]['leadership']).to eq("The mayor of Dimsdale")
    expect(towns[0]['taverns']).to eq("the armoured duck")
    expect(towns[0]['shops']).to eq("A hair solon")
  end
end