class User < ApplicationRecord
  EMAIL_FORMAT = /[^\s]@[^\s]/
  has_secure_password

  validates :name, presence: true
  validates :email, format: { with: EMAIL_FORMAT }, uniqueness: true
  # validates :email, presence: true, format: { with: EMAIL_FORMAT }
end
