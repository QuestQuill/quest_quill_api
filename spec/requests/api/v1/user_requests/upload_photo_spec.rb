require 'rails_helper'

RSpec.describe 'Update a user' do
  before :each do
    load_test_data
  end

  # not presently working
  xit 'can upload picture to a user' do
    file = fixture_file_upload('public/images/test_user_image.png', 'image/png')

    post "/api/v1/users/#{@user1.id}/upload_photo", params: { user_photo: file }

    expect(response).to be_successful
    @user1.reload
require 'pry';binding.pry
    expect(@user1.user_photo).to be_attached
  end
end