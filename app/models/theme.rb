class Theme < ApplicationRecord
  validates :name, presence: true

  has_many :campaign_themes
  has_many :campaigns, through: :campaign_themes
end
