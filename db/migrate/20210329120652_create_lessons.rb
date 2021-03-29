class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :content
      t.text :video_url
      t.text :document_url

      t.timestamps
    end
  end
end
