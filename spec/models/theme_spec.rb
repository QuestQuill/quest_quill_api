require 'rails_helper'

RSpec.describe Theme, type: :model do
  describe "relationships" do
    it { should have_many :campaign_themes }
    it { should have_many(:campaigns).through(:campaign_themes) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end
end
