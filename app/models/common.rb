class Common < ActiveRecord::Base
  attr_accessible :code, :title
  has_and_belongs_to_many :feasts
  validates :code, :presence => true
  
  def to_s
    title
  end
end
