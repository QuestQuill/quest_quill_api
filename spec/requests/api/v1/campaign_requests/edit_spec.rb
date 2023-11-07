require 'rails_helper'

RSpec.describe 'Update a user' do
  before :each do
    load_test_data
  end

  it 'can edit the details of a campaign' do
    previous_name = @campaign1.name
    campaign_params = ({ 
                    name: "Coolest Campaign Ever!!",
                    themes: ["Awesoem", "Cool"],
                    player_num: 4
    })
    headers = {"CONTENT_TYPE" => "application/json"}
  
    patch "/api/v1/users/#{@user1.id}/campaigns/#{@campaign1.id}", headers: headers, params: JSON.generate(campaign_params)

    expect(response).to be_successful
    @campaign1.reload

    expect(previous_name).to eq("Campaign 1")
    expect(@campaign1.name).to eq("Coolest Campaign Ever!!")

  end

  # not presently working
  it 'can upload picture to a campaign' do
    file = fixture_file_upload('public/images/test_campaign_image.png', 'image/png')

    post "/api/v1/users/#{@user1.id}/campaigns/#{@campaign1.id}/upload_photo", params: { campaign_photo: file }

    expect(response).to be_successful
    @campaign1.reload
# require 'pry';binding.pry
    expect(@campaign1.campaign_photo).to be_attached
  end
end