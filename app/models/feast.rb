class Feast < ActiveRecord::Base
  attr_accessible :color_id, :day, :month, :ordo_id, :rank_id, :title
  belongs_to :rank
  belongs_to :ordo
  belongs_to :color
  has_and_belongs_to_many :commons
  
  resourcify
  
  validates :day, :month, :ordo_id, :rank_id, :title, :presence => true
  
  def to_s
    title
  end
end
