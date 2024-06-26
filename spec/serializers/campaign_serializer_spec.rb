require 'rails_helper'

RSpec.describe 'Campaign Serializer' do
  before :each do
    load_test_data
  end

  it "returns the JSON campaign object within the serializer's format" do
    serialized_campaign = CampaignSerializer.new(@campaign1).serializable_hash

    expected_format = {
      data: {
        id: @campaign1.id.to_s,
        type: :campaign,
        attributes: {
          name: @campaign1.name,
          player_num: @campaign1.player_num,
          user_id: @campaign1.user_id,
          themes: @campaign1.themes,
          campaign_photo: @campaign1.campaign_photo
        }
      }
    }
  end
end