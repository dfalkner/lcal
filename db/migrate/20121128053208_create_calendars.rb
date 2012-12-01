class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.date :cal_date, :null => false
      t.integer :season_id, :null => false
      t.integer :week
      t.string :day
      t.integer :rank_id
      t.integer :color_id
      t.string :title

      t.timestamps
    end
    
  end
end
