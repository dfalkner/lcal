class AddIndexToCalendars < ActiveRecord::Migration
  def change
    add_index :calendars, :data
    add_index :calendars, :updated_at 
    add_index :calendars, :ordo_id
  end
end
