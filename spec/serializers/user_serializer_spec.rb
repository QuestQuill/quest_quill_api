require 'rails_helper'

RSpec.describe 'User Serializer' do
  before :each do
    load_test_data
  end

  it "returns the JSON user object within the serializer's format" do
    serialized_user = UserSerializer.new(@user1).serializable_hash
    users_campaigns = @user1.campaigns

    expected_format = {
      data: {
        id: @user1.id.to_s,
        type: :user,
        attributes: {
          uid: nil,
          username: @user1.username,
          email: @user1.email,
          token: @user1.token,
          token_expiration: @user1.token_expiration,
          auth_token: nil,
          user_photo: @user1.user_photo,
          campaigns: users_campaigns
        }
      }
    }

    expect(serialized_user).to eq(expected_format)
  end
end