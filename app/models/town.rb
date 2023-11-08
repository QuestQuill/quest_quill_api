class Town < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :leadership, presence: true
  validates :taverns, presence: true
  validates :shops, presence: true
  validates :campaign, presence: true

  has_one_attached :town_photo

  belongs_to :campaign
end
