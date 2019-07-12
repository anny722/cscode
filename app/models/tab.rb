class Tab < ApplicationRecord
  belongs_to :question
  has_many :comments, dependent: :destroy
  validates :name, presence: true
end
