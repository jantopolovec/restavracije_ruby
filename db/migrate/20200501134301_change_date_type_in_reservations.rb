class ChangeDateTypeInReservations < ActiveRecord::Migration[6.0]
  def change
    change_column :reservations, :od, :datetime
    change_column :reservations, :do, :datetime
  end
end
