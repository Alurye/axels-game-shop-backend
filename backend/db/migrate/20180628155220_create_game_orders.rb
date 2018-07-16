class CreateGameOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :game_orders do |t|
      t.integer :order_id
      t.integer :game_id
      t.timestamps
    end
  end
end
