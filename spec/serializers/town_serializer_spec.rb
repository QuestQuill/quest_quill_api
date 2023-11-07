require 'rails_helper'

RSpec.describe 'Town Serializer' do
  before :each do
    load_test_data
  end

  it "returns the JSON town object within the serializer's format" do
    serialized_town = TownSerializer.new(@town1).serializable_hash

    expected_format = {
      data: {
        id: @town1.id.to_s,
        type: :town,
        attributes: {
          name: @town1.name,
          description: @town1.description,
          leadership: @town1.leadership,
          shops: @town1.shops,
          taverns: @town1.taverns,
          campaign_id: @town1.campaign_id,
          town_photo: @town1.town_photo
        }
      }
    }

    expect(serialized_town).to eq(expected_format)
  end
end