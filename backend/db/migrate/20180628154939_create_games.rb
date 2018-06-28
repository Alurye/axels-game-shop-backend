class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.string :console
      t.integer :quantity
      t.decimal :price
      t.string :genre
      t.string :img
      t.string :description

      t.timestamps
    end
  end
end
