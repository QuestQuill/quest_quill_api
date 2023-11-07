require 'rails_helper'

RSpec.describe Campaign, type: :model do
  describe "relationships" do
    it { should belong_to :user }
    it { should have_many :towns }
  end

  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:player_num)}
    it {should validate_presence_of(:themes)}
  end
end
