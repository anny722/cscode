class Solution < ApplicationRecord
  belongs_to :tab, optional: true
  belongs_to :question
  validates :solution, presence: true
end
