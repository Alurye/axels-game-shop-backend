class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :address_2
      t.string :e_mail
      t.string :country
      t.string :state
      t.integer :zip_code

      t.timestamps
    end
  end
end
