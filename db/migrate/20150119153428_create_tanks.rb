class CreateTanks < ActiveRecord::Migration
  def change
    create_table :tanks do |t|
      t.integer :number
      t.float :volume
      t.float :filled
      t.integer :gasoline_id

      t.timestamps null: false
    end
  end
end
