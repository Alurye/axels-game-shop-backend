class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string  :title
      t.string  :console
      t.integer :quantity
      t.decimal :price, precision: 10, scale: 2
      t.string  :genre
      t.string  :img
      t.string  :description
      t.integer :store_id
      t.timestamps
    end
  end
end
