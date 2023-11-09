require 'rails_helper'

RSpec.describe 'Quest Serializer' do
  before :each do
    load_test_data
  end

  it "returns the JSON Quest object within the serializer's format" do
    serialized_quest = QuestSerializer.new(@quest1).serializable_hash

    expected_format = {
      data: {
        id: @quest1.id.to_s,
        type: :quest,
        attributes: {
          name: @quest1.name,
          description: @quest1.description,
          goal: @quest1.goal,
          campaign_id: @quest1.campaign_id
        }
      }
    }

    expect(serialized_quest).to eq(expected_format)
  end
end