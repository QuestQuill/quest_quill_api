class Quest < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    validates :goal, presence: true
  
    has_one_attached :quest_photo

    belongs_to :campaign
end