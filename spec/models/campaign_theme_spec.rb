require 'rails_helper'

RSpec.describe CampaignTheme, type: :model do
  describe "relationships" do
    it { should belong_to(:campaign) }
    it { should belong_to(:theme) }
  end
end
