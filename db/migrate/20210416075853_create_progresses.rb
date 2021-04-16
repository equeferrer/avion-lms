class CreateProgresses < ActiveRecord::Migration[6.0]
  def change
    create_table :progresses do |t|
      t.string :username
      t.string :repo
      t.integer :passed
      t.integer :total
      t.text :pending

      t.timestamps
    end
  end
end
