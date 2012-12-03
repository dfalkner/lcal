class Calendar < ActiveRecord::Base
  attr_accessible :color_id, :data, :day_of_week, :rank_id, :season_id, :title, :week
  
  belongs_to :season
  belongs_to :rank
  belongs_to :color
  
  validates :data, :presence => true
end
