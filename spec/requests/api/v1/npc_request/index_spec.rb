require 'rails_helper'

RSpec.describe "Towns API" do
  before :each do
    load_test_data
  end

  it "can get a list of all towns" do
    get "/api/v1/users/#{@user1.id}/campaigns/#{@campaign1.id}/npcs"

    expect(response).to be_successful

    npcs = JSON.parse(response.body)

    expect(npcs).to be_a(Array)
    expect(npcs.size).to eq(3) 
    expect(npcs).to all(have_key('name'))
    expect(npcs).to all(have_key('gender'))
    expect(npcs).to all(have_key('race'))
    expect(npcs).to all(have_key('klass'))
    expect(npcs).to all(have_key('description'))
    expect(npcs).to all(have_key('attitude'))
    
    expect(npcs[0]).to be_a(Hash)
    expect(npcs[0]['name']).to eq('Elowen Swiftblade')
    expect(npcs[0]['gender']).to eq("Female")
    expect(npcs[0]['race']).to eq("Elf")
    expect(npcs[0]['klass']).to eq("Rogue")
    expect(npcs[0]['description']).to eq("A lithe and agile elf")
    expect(npcs[0]['attitude']).to eq("Mysterious")
  end
end