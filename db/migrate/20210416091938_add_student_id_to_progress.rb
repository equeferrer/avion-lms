class AddStudentIdToProgress < ActiveRecord::Migration[6.0]
  def change
    add_column :progresses, :student_id, :integer
  end
end
