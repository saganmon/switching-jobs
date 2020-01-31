class CreateOffices < ActiveRecord::Migration[5.2]
  def change
    create_table :offices do |t|
      t.string :company_name,   null: false, unique: true, index: true
      t.text   :overview
      t.string :ceo,            unique: true
      t.string :foundation,     unique: true
      t.string :people
      t.timestamps null: false
    end
  end
end