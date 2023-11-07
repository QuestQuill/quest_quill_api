class Quest < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    validates :goal, presence: true
  

    belongs_to :campaign
end