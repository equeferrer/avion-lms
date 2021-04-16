class Lesson < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  has_many :batch_lessons, dependent: :destroy
  has_many :batches, through: :batch_lessons
  def next
    self.class.where("id > ?", id).first
  end

  def previous
    self.class.where("id < ?", id).last
  end
end
