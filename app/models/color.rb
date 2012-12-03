class Color < ActiveRecord::Base
  attr_accessible :code, :title
  validates :code, :presence => true
  has_many :calendars
  has_many :feasts
  
  def to_s
    title
  end
end
