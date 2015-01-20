class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :gas
      t.decimal :price, precision: 10, scale: 2
      t.float :amount
      t.decimal :sum
      t.integer :operator_id

      t.timestamps null: false
    end
  end
end
