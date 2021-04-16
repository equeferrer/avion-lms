class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  belongs_to :batch
  has_one :progress, dependent: :destroy
  # before_create :add_to_batch

  # def add_to_batch
  #   Batch.last.students << current_student
  # end
end
