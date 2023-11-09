require 'rails_helper'

RSpec.describe 'Update an NPC' do
  before :each do
    load_test_data
  end

  it 'can edit the details of an NPC' do
    previous_name = @npc1.name
    npc_params = ({ 
                  name: "Sargent Cool McCoolPants"
    })
    headers = {"CONTENT_TYPE" => "application/json"}
  
    patch "/api/v1/users/#{@user1.id}/campaigns/#{@campaign1.id}/npcs/#{@npc1.id}", headers: headers, params: JSON.generate(npc_params)

    expect(response).to be_successful
    @npc1.reload

    expect(previous_name).to eq("Elowen Swiftblade")
    expect(@npc1.name).to eq("Sargent Cool McCoolPants")
  end

  it 'can upload picture to an NPC' do
    file = fixture_file_upload('public/images/test_npc_image.png', 'image/png')

    post "/api/v1/users/#{@user1.id}/campaigns/#{@campaign1.id}/npcs/#{@npc1.id}/upload_photo", params: { npc_photo: file }

    expect(response).to be_successful
    @npc1.reload

    expect(@npc1.npc_photo).to be_attached
  end

  it 'Sad Path edit with bad info' do
    previous_name = @npc1.name
    npc_params = ({ name: ''})
    headers = {"CONTENT_TYPE" => "application/json"}
  
    patch "/api/v1/users/#{@user1.id}/campaigns/#{@campaign1.id}/npcs/#{@npc1.id}", headers: headers, params: JSON.generate(npc_params)

    expect(response).to have_http_status(:unprocessable_entity)
    @npc1.reload

    expect(previous_name).to eq("Elowen Swiftblade")
    expect(@npc1.name).to eq(previous_name)
    
  end
end