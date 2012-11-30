class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :title, :null => false
      t.string :code, :null => false

      t.timestamps
    end
    add_index :colors, :code, unique: true
  end
end
