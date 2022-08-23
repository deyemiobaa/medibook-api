class AddPictureToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :picture, :string
  end
end
