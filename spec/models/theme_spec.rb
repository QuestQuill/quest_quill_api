require 'rails_helper'

RSpec.describe Theme, type: :model do
  describe "relationships" do
    it { should belong_to :campaign }
  end

  describe "validations" do
    it {should validate_presence_of(:name)}
  end
end
