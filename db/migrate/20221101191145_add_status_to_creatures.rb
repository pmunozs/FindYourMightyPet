class AddStatusToCreatures < ActiveRecord::Migration[7.0]
  def change
    add_column :creatures, :adopted, :boolean
  end
end
