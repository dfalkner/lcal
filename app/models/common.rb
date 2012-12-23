class Common < ActiveRecord::Base
  attr_accessible :code, :title
  has_and_belongs_to_many :feasts
  validates :title, :code, :presence => true
  
  resourcify
  
  def to_s
    title
  end
end
