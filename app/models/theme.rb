class Theme < ApplicationRecord
  validates :name, presence: true

  belongs_to :campaign
end
