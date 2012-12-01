class Calendar < ActiveRecord::Base
  attr_accessible :cal_date, :color_id, :day, :title, :rank_id, :season_id, :week
  
  belongs_to :season
  belongs_to :rank
  belongs_to :color
  
  validates :cal_date, :presence => true
end
