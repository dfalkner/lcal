class CreateCommons < ActiveRecord::Migration
  def change
    create_table :commons do |t|
      t.string :code, :null => false
      t.string :title, :null => false

      t.timestamps
    end
    add_index :commons, :code, unique: true
  end
end
