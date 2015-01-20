class ChangeOperatorsName < ActiveRecord::Migration
  def change
    change_column :operators, :name, :string, unique: true
  end
end
