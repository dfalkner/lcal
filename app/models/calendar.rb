class Calendar < ActiveRecord::Base
  attr_accessible :color_id, :data, :day_of_week, :ordo_id, :rank_id, :season_id, :title, :week_in_season
  belongs_to :colors
  belongs_to :ordos
  belongs_to :ranks
  belongs_to :seasons
  
  validates :title, :data, :ordo_id, :rank_id, :season_id, :presence => true
  
  
  default_scope order("data ASC")
  
end
