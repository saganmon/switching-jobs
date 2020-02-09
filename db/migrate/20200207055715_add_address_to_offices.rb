class AddAddressToOffices < ActiveRecord::Migration[5.2]
  def change
    add_column :offices, :address, :string
  end
end
