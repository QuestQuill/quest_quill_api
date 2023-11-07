require 'rails_helper'

RSpec.describe 'User Serializer' do
  before :each do
    load_test_data
  end

  it "returns the JSON user object within the serializer's format" do
    serialized_user = UserSerializer.new(@user1).serializable_hash

    expected_format = {
      data: {
        id: @user1.id.to_s,
        type: :user,
        attributes: {
          username: @user1.username,
          email: @user1.email
        }
      }
    }

    expect(serialized_user).to eq(expected_format)
  end
end