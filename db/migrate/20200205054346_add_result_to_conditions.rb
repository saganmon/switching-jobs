class AddResultToConditions < ActiveRecord::Migration[5.2]
  def change
    add_column :conditions, :result, :integer
  end
end
