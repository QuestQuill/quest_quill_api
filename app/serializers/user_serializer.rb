class UserSerializer
  include JSONAPI::Serializer

  set_type :user
  set_id :id
  attributes :uid, :username, :email, :user_photo, :token, :token_expiration, :auth_token, :campaigns
end