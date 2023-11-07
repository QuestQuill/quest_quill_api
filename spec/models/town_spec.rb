require 'rails_helper'

RSpec.describe Town, type: :model do
  describe "relationships" do
    it { should belong_to :campaign }
  end

  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:leadership)}
    it {should validate_presence_of(:taverns)}
    it {should validate_presence_of(:shops)}
    it {should validate_presence_of(:campaign)}
  end
<<<<<<< HEAD
=======

>>>>>>> 578a9f60f3855c9c019fd189e121dadcf1316358
end
