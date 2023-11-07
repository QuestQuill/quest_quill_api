class NpcSerializer
  include JSONAPI::Serializer

  set_type :npc
  set_id :id
  attributes :name, :description, :gender, :race, :klass, :attitude, :campaign_id, :npc_photo
end
