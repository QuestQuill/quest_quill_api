require 'rails_helper'

RSpec.describe "Edit a Quest" do
  before :each do
    load_test_data
  end

  it "can edit the details of a Quest" do
    previous_name = @quest1.name
    quest_params = ({ 
                    name: "Quest for the missing shoe",
                    description: "its a quest",
                    goal: "To find my missing shoe"
    })
    headers = {"CONTENT_TYPE" => "application/json"}
  
    patch "/api/v1/users/#{@user1.id}/campaigns/#{@campaign1.id}/quests/#{@quest1.id}", headers: headers, params: JSON.generate(quest_params)

    expect(response).to be_successful
    @quest1.reload

    expect(previous_name).not_to eq(@quest1.name)
    expect(@quest1.name).to eq("Quest for the missing shoe")
  end

  it "can upload an image to associated with the quest" do
    file = fixture_file_upload('public/images/test_quest_image.png', 'image/png')

    post "/api/v1/users/#{@user1.id}/campaigns/#{@campaign1.id}/quests/#{@quest1.id}/upload_photo", params: { quest_photo: file }

    expect(response).to be_successful
    @quest1.reload

    expect(@quest1.quest_photo).to be_attached
  end

  it 'Sad Path edit with bad info' do
    previous_name = @quest1.name
    quest_params = ({ name: ''})
    headers = { "CONTENT_TYPE" => "application/json" }
  
    patch "/api/v1/users/#{@user1.id}/campaigns/#{@campaign1.id}/quests/#{@quest1.id}", headers: headers, params: JSON.generate(quest_params)
  
    expect(response).to have_http_status(:unprocessable_entity)
    @quest1.reload
  
    expect(previous_name).to eq("Rescue the Lost Heir") 
    expect(@quest1.name).to eq(previous_name)
  end
  
end