class Common < ActiveRecord::Base
  attr_accessible :code, :title
  has_and_belongs_to_many :roman_calendars
  
  validates :code, :presence => true
end
