require 'rails_helper'

RSpec.describe Npc, type: :model do
  describe "relationships" do
    it { should belong_to :campaign }
  end

  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:gender)}
    it {should validate_presence_of(:race)}
    it {should validate_presence_of(:klass)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:attitude)}
  end
end