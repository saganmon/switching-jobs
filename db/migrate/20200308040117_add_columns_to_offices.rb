class AddColumnsToOffices < ActiveRecord::Migration[5.2]
  def change
    remove_column :offices, :people, :integer
    remove_column :offices, :foundation, :integer
    add_column :offices, :poople,     :integer
    add_column :offices, :foundation, :integer
  end
end
