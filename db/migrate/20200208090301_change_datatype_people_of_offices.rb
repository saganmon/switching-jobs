class ChangeDatatypePeopleOfOffices < ActiveRecord::Migration[5.2]
  def change
    change_column :offices, :people, 'integer'
  end
end
