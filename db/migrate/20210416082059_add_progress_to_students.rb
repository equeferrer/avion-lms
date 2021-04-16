class AddProgressToStudents < ActiveRecord::Migration[6.0]
  def change
    add_reference :students, :progress, foreign_key: true
  end
end
