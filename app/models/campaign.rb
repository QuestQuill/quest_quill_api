class Campaign < ApplicationRecord
  validates :name, presence: true
  validates :player_num, presence: true
  validates :themes, presence: true

  belongs_to :user
  has_many :towns
  has_many :npcs
  has_many :quests
end
