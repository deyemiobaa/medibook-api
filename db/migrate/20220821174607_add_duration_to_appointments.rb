class AddDurationToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :duration, :integer
  end
end
