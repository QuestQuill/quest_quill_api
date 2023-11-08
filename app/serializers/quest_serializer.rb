class QuestSerializer
  include JSONAPI::Serializer

  set_type :quest
  set_id :id
  attributes :name, :description, :goal, :quest_photo
end
