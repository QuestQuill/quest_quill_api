require 'rails_helper'

RSpec.describe Campaign, type: :model do
  describe "relationships" do
    it { should belong_to :user }
    it { should have_many :towns }
    it { should have_many :npcs }
    it { should have_many :quests }
    it { should have_many :campaign_themes }
    it { should have_many(:themes).through(:campaign_themes) }

  end

  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:player_num)}
  end
end
