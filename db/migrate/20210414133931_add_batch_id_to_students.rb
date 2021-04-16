class AddBatchIdToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :batch_id, :integer
  end
end
