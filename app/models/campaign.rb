class Campaign < ApplicationRecord
  validates :name, presence: true
  validates :player_num, presence: true
  validates :themes, presence: true

  belongs_to :user
  has_many :towns
end
