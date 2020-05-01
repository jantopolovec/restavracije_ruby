class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.date :od
      t.date :do
      t.integer :user_id
      t.integer :room_id
      t.integer :osebe
      t.integer :cena

      t.timestamps
    end
  end
end
