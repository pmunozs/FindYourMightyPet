class CreateCreatures < ActiveRecord::Migration[7.0]
  def change
    create_table :creatures do |t|
      t.string :name
      t.integer :age
      t.string :ability
      t.text :description

      t.timestamps
    end
  end
end
