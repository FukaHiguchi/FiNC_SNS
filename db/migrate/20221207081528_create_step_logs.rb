class CreateStepLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :step_logs do |t|
      t.bigint :footsteps, null: false
      t.float :distant
      t.bigint :burned_calorie
      t.float :duration

      t.timestamps
    end
  end
end
