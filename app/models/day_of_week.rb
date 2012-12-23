class DayOfWeek < ActiveRecord::Base
  attr_accessible  
  
  has_many :calendars
  
  def to_s
    title
  end
end
