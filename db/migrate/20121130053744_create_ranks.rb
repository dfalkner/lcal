class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.string :title, :null => false
      t.string :code, :null => false

      t.timestamps
    end
    add_index :ranks, :code, unique: true
  end
end
