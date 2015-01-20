class ChangeGasolinesNameToUnique < ActiveRecord::Migration
  def change
    change_column :gasolines, :name, :string, unique: true
    change_column :tanks, :number, :integer, unique: true
  end
end
