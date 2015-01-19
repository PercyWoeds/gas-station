class ChangeGasolineClass < ActiveRecord::Migration
  def change
    remove_column :gasolines, :class, :integer
    add_column :gasolines, :grade, :integer
  end
end
