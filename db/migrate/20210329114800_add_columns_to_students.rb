class AddColumnsToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :first_name, :string
    add_column :students, :last_name, :string
    add_column :students, :github_user, :string
  end
end
