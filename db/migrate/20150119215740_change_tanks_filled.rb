class ChangeTanksFilled < ActiveRecord::Migration
  def change
    change_column :tanks, :filled, :float, default: 0
  end
end
