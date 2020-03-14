class CreateActivityLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_logs do |t|
      t.string :time, null: false
      t.string :log,  null: false
      t.timestamps
    end
  end
end
