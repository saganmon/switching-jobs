class CreateConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions do |t|
      t.integer :phase
      t.string  :date
      t.text    :memo
      t.references :office,  foreign_key: true
      t.timestamps null: false
    end
  end
end
