class Batch < ApplicationRecord
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  has_many :batch_lessons, dependent: :destroy
  has_many :lessons, through: :batch_lessons
  has_many :students, dependent: :destroy
end
