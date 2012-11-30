class RomanCalendar < ActiveRecord::Base
  attr_accessible :color, :description, :feast_day, :rank_id, :ordo_id, :season_id
  belongs_to :rank
  belongs_to :ordo
  belongs_to :season
  belongs_to :color
  has_and_belongs_to_many :commons
  
  validates :feast_day, :rank_id, :presence => true
  
end
