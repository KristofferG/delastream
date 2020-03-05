class Comment < ApplicationRecord
  belongs_to :package
  validates :available, presence: true
  validates :commenter, presence: true
end
