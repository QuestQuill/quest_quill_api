require 'rails_helper'

RSpec.describe User, type: :model do
  describe "relationships" do
    it { should have_many :campaigns }
  end

  describe "validations" do
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password)}
    it {should validate_presence_of(:email)}
  end

  describe "methods" do
    before(:each) do
      load_test_data
    end
    it "can search_by_email" do
      
      results = User.search_by_email('user1@example.com')

      expect(results).to include(@user1)
      expect(results).not_to include(@user2)
      expect(results).not_to include(@user3)
    end

    it "can search_by_token" do
      results = User.search_by_token("abcdefg")

      expect(results).to include(@user1)
      expect(results).not_to include(@user2)
      expect(results).not_to include(@user3)
    end
  end
end
