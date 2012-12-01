class Season < ActiveRecord::Base
  attr_accessible :code, :title
  
  has_many :feasts
end
