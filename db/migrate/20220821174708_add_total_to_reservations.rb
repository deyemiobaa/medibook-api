class AddTotalToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :total, :integer
  end
end
