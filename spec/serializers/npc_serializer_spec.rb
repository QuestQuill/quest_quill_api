require 'rails_helper'

RSpec.describe 'NPC Serializer' do
  before :each do
    load_test_data
  end

  it "returns the JSON NPC object within the serializer's format" do
    serialized_npc = NpcSerializer.new(@npc1).serializable_hash

    expected_format = {
      data: {
        id: @npc1.id.to_s,
        type: :npc,
        attributes: {
          name: @npc1.name,
          description: @npc1.description,
          gender: @npc1.gender,
          race: @npc1.race,
          klass: @npc1.klass,
          attitude: @npc1.attitude,
          campaign_id: @npc1.campaign_id,
          npc_photo: @npc1.npc_photo
        }
      }
    }

    expect(serialized_npc).to eq(expected_format)
  end
end