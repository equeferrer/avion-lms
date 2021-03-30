class CreateBatchLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :batch_lessons do |t|
      t.references :batch, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
