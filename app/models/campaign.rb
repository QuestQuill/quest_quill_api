class Campaign < ApplicationRecord
  validates :name, presence: true
  validates :player_num, presence: true

  has_one_attached :campaign_photo

  belongs_to :user
  has_many :towns
  has_many :npcs
  has_many :quests
  has_many :themes
end
