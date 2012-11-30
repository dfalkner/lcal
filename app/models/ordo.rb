class Ordo < ActiveRecord::Base
  attr_accessible :code, :title
  has_many :roman_calendars
  
  validates :code, :title, :presence => true
end
