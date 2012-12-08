class Season < ActiveRecord::Base
  attr_accessible :code, :title
  validates :code, :title, :presence => true
  has_many :feasts
  has_many :calendars
  
  def to_s
    title
  end
end
