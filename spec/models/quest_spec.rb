require 'rails_helper'

RSpec.describe Quest, type: :model do
  describe "relationships" do
    it { should belong_to :campaign }
  end

  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:goal)}
  end
end