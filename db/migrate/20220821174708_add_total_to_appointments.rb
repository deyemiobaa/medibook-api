class AddTotalToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :total, :integer
  end
end
