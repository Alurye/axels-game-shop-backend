class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :address_2
      t.string :e_mail
      t.string :country
      t.string :state
      t.integer :zip_code
      t.integer :store_id
      t.string :order_number
      t.timestamps
    end
  end
end
