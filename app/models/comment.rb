class Comment < ApplicationRecord
  belongs_to :tab, optional: true
  belongs_to :question
  validates :comment, presence: true
end
