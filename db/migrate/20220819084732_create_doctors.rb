class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialization
      t.string :available_times
      t.decimal :hourly_rate

      t.timestamps
    end
  end
end
