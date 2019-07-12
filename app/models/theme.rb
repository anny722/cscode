class Theme < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  validates :name, presence: true
end
