class AddUserIdToConditions < ActiveRecord::Migration[5.2]
  def change
    add_column :conditions, :user_id, :integer
  end
end
