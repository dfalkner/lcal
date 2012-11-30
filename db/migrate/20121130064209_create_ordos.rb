class CreateOrdos < ActiveRecord::Migration
  def change
    create_table :ordos do |t|
      t.string :title, :null => false
      t.string :code, :null => false

      t.timestamps
    end
    add_index :ordos, :code, unique: true
  end
end
