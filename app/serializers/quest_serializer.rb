class QuestSerializer
  include JSONAPI::Serializer

  set_type :quest
  set_id :id
  attributes :name, :description, :goal, :campaign_id, :quest_photo
end
