class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.integer :ordo_id
      t.date :data
      t.integer :rank_id
      t.integer :season_id
      t.integer :color_id
      t.integer :week_in_season
      t.integer :day_of_week_id
      t.string :title

      t.timestamps
    end
    
  end
end
