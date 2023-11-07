class TownSerializer
  include JSONAPI::Serializer

  set_type :town
  set_id :id
  attributes :name, :description, :leadership, :shops, :taverns, :campaign_id, :town_photo
end