class CreateBuildings < ActiveRecord::Migration[6.0]
  def change
    create_table :buildings do |t|
      t.string :ime
      t.integer :zvezdice
      t.text :opis
      t.string :naslov
      t.string :kraj
      t.string :tip
      t.integer :user_id
      t.timestamps
    end
  end
end
