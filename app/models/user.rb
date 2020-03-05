class User < ApplicationRecord
  has_one :wants_list, dependent: :destroy
  has_one :have_list, dependent: :destroy
  validates :name, presence: true
  EMAIL_FORMAT_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: EMAIL_FORMAT_REGEX }, uniqueness: true

  before_save { self.email = email.downcase }

  has_secure_password
end
