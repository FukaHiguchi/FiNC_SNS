class CreateUserStepLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :user_step_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :step_log, null: false, foreign_key: true

      t.timestamps
    end
  end
end
