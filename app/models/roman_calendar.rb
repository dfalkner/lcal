class RomanCalendar < ActiveRecord::Base
  attr_accessible :color, :description, :feast_day, :rank_id, :ordo_id, :season_id
  belongs_to :rank
  belongs_to :ordo
  belongs_to :season
  
  validates :feast_day, :rank_id, :presence => true
  
end
