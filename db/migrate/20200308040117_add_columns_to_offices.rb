class AddColumnsToOffices < ActiveRecord::Migration[5.2]
  def change
    add_column :offices, :poople,     :integer
    add_column :offices, :foundation, :integer
  end
end
