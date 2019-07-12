class Question < ApplicationRecord
  belongs_to :theme
  has_many :tabs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :solutions, dependent: :destroy
  has_many :outputs, dependent: :destroy
  has_many :links, dependent: :destroy
  validates :subject, presence: true
end
