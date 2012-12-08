class Ordo < ActiveRecord::Base
  attr_accessible :code, :title
  has_many :feasts  
  has_many :calendars
  validates :code, :title, :presence => true
  
  def to_s
    title
  end
end
