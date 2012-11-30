class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.date :cal_date, :null => false
      t.string :season, :null => false
      t.integer :week
      t.string :day
      t.integer :rank_id
      t.string :color
      t.string :description

      t.timestamps
    end
    add_index :calendars, :cal_date, unique: true
    
  end
end
