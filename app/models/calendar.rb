class Calendar < ActiveRecord::Base
  attr_accessible :color_id, :data, :day_of_week, :ordo_id, :rank_id, :season_id, :title, :week_in_season
  belongs_to :color
  belongs_to :ordo
  belongs_to :rank
  belongs_to :season
  
  validates :title, :data, :ordo_id, :rank_id, :season_id, :presence => true
  
  
  default_scope order("data ASC")
  
end
