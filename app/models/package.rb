class Package < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :have_lists
  validates :provider, presence: true
end
