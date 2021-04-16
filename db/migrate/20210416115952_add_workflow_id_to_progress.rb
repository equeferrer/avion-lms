class AddWorkflowIdToProgress < ActiveRecord::Migration[6.0]
  def change
    add_column :progresses, :workflow_id, :integer
  end
end
