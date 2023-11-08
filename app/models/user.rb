class User < ApplicationRecord
  validates :username, presence: true
  validates :password, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password
  
  has_many :campaigns

  def self.search_by_email(email)
    where('lower(email) LIKE ?', "%#{email.downcase}%")
  end

  def self.search_by_token(token)
    where('token = ? AND token_expiration > ?', token, Time.now)
  end
end
