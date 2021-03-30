class CreateBatches < ActiveRecord::Migration[6.0]
  def change
    create_table :batches do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :status

      t.timestamps
    end
  end
end
