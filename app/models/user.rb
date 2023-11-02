class User < ApplicationRecord
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :campaigns
end
