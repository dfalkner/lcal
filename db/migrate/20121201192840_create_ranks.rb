class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.string :code
      t.string :title
      t.integer :position

      t.timestamps
    end
    add_index :ranks, :code, unique: true
  end
end
