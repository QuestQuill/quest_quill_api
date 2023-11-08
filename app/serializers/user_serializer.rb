class UserSerializer
  include JSONAPI::Serializer

  set_type :user
  set_id :id
  attributes :username, :email, :user_photo, :token, :token_expiration, :campaigns
end