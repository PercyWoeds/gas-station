class CreateGasolines < ActiveRecord::Migration
  def change
    create_table :gasolines do |t|
      t.string :name
      t.integer :class
      t.decimal :price, precision: 10, scale: 2

      t.timestamps null: false
    end
  end
end
