class User < ActiveRecord::Base
  has_secure_password
  has_many :listeners
  has_many :songs, through: :listeners

  validates :first_name, :last_name, :email, presence: true
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
