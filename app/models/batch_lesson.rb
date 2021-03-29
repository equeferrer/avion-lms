class BatchLesson < ApplicationRecord
  belongs_to :batch
  belongs_to :lesson
end
