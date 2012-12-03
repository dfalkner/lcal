class Rank < ActiveRecord::Base
  attr_accessible :code, :position, :title
  has_many :feasts
  validates :code, :title, :presence => true
  default_scope order("position ASC")
  
  def to_s
    title
  end
end
