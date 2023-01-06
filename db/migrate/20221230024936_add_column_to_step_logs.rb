class AddColumnToStepLogs < ActiveRecord::Migration[6.1]
  def change
    add_column :step_logs, :user_id, :integer
  end
end
