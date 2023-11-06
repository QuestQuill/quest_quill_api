class Npc < ApplicationRecord
    validates :name, presence: true
    validates :gender, presence: true
    validates :race, presence: true
    validates :klass, presence: true
    validates :description, presence: true
    validates :attitude, presence: true

    belongs_to :campaign
end