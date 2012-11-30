class CreateRomanCalendars < ActiveRecord::Migration
  def change
    create_table :roman_calendars do |t|
      t.integer :ordo_id, :null => false
      t.string :feast_day
      t.integer :rank_id, :null => false
      t.integer :color_id
      t.string :title

      t.timestamps
    end
  end
end
