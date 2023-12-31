class CampaignSerializer
  include JSONAPI::Serializer

  set_type :campaign
  set_id :id
  attributes :name, :player_num, :themes, :user_id, :campaign_photo
end

# Potential to add the towns, npcs, quests relationships to the serializer