class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :building_id
      t.string :tip
      t.integer :stevilka
      t.integer :klima
      t.integer  :balkon
      t.integer :wifi
      t.integer :invalidi
      t.integer :zivali
      t.integer :fitnes
      t.integer :kajenje
      t.integer :postrezba
      t.integer :restavracija
      t.integer :bar
      t.integer :recepcija
      t.integer :bazen
      t.integer :dvigalo
      t.integer :cena

      t.timestamps
    end
  end
end
