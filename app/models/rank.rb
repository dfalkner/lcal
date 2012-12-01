class Rank < ActiveRecord::Base
  attr_accessible :code, :title
  has_many :feasts
  
  validates :code, :title, :presence => true
  
end
