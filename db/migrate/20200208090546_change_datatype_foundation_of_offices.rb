class ChangeDatatypeFoundationOfOffices < ActiveRecord::Migration[5.2]
  def change
    change_column :offices, :foundation, 'integer'
  end
end
