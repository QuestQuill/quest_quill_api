class CampaignSerializer
  include JSONAPI::Serializer

  set_type :campaign
  set_id :id
  attributes :name, :player_num, :user_id, :themes, :campaign_photo

  attribute :themes do |campaign|
    campaign.themes.map(&:name)
  end
end

# Potential to add the towns, npcs, quests relationships to the serializer