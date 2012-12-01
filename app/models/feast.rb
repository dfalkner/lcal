class Feast < ActiveRecord::Base
  attr_accessible :color_id, :day, :month, :ordo_id, :rank_id, :title, :season_id
  
  belongs_to :rank
  belongs_to :ordo
  belongs_to :season
  belongs_to :color
  has_and_belongs_to_many :commons
  

  
end
