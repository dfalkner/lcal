class Season < ActiveRecord::Base
  attr_accessible :code, :title
  
  has_many :roman_calendars
end
