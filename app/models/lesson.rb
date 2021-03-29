class Lesson < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  has_many :batch_lessons
  has_many :batches, through: :batch_lessons
end
