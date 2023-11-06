class User < ApplicationRecord
  validates :username, presence: true
  validates :password, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password
  
  has_many :campaigns
end
