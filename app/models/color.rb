class Color < ActiveRecord::Base
  attr_accessible :code, :title
  validates :code, :presence => true
  has_many :calendars
  has_many :roman_calendars
end
