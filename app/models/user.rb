class User < ApplicationRecord
  validates :username, presence: true
  validates :password, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password
  
  has_many :campaigns

  has_one_attached :user_photo

  def self.search_by_username(username)
    where('lower(username) LIKE ?', "%#{username.downcase}%")
  end
end
