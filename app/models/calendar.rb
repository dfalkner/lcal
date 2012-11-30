class Calendar < ActiveRecord::Base
  attr_accessible :cal_date, :color, :day, :description, :rank_id, :season_id, :week
  
  belongs_to :season
  belongs_to :rank
  
  validates :cal_date, :presence => true
end
