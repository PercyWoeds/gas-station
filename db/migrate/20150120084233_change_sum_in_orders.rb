class ChangeSumInOrders < ActiveRecord::Migration
  def change
    change_column :orders, :sum, :decimal, precision: 10, scale: 2
  end
end
