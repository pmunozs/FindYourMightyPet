class AddAddressToCreatures < ActiveRecord::Migration[7.0]
  def change
    add_column :creatures, :address, :string
    add_column :creatures, :latitude, :float
    add_column :creatures, :longitude, :float
  end
end
