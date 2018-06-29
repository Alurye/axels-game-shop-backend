class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.integer :admin_id
      t.timestamps
    end
  end
end
