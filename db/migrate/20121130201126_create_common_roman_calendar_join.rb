class CreateCommonRomanCalendarJoin < ActiveRecord::Migration
  def up
    create_table 'commons_roman_calendars', :id => false do |t|
      t.column 'common_id', :integer
      t.column 'roman_calendar_id', :integer
    end
  end

  def down
    drop_table 'commons_roman_calendars'
  end
end
