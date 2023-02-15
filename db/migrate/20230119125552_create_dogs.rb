class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      t.string :cafe_name
      t.string :adress
      t.string :price
      t.string :recommend

      t.timestamps
    end
  end
end
