class AddCoordinatesToOffices < ActiveRecord::Migration[5.2]
  def change
    add_column :offices, :coordinates, :string
  end
end
