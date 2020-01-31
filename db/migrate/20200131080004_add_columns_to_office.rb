class AddColumnsToOffice < ActiveRecord::Migration[5.2]
  def change
    add_column :offices, :area, :string
    add_column :offices, :revenue, :integer
  end
end
