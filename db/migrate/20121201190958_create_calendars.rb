class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.date :data, :null => false
      t.integer :season_id
      t.integer :week
      t.string :day_of_week
      t.integer :rank_id, :null => false
      t.integer :color_id
      t.string :title

      t.timestamps
    end
    add_index :calendars, :season_id
  end
end
