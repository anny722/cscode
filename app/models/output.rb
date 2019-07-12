class Output < ApplicationRecord
  belongs_to :tab, optional: true
  belongs_to :question
  validates :output, presence: true
end
