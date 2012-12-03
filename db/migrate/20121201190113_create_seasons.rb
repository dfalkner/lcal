class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :code, :null => false
      t.string :title, :null => false

      t.timestamps
    end
    add_index :seasons, :code, unique: true
  end
end
