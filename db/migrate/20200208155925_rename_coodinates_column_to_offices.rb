class RenameCoodinatesColumnToOffices < ActiveRecord::Migration[5.2]
  def change
    rename_column :offices, :coordinates, :url
  end
end
