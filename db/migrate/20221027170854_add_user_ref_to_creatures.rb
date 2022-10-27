class AddUserRefToCreatures < ActiveRecord::Migration[7.0]
  def change
    add_reference :creatures, :user, foreign_key: true
  end
end
