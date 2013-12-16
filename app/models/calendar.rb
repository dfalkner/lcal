class Calendar < ActiveRecord::Base
  attr_accessible :color_id, :data, :day_of_week_id, :ordo_id, :rank_id, :season_id, :title, :week_in_season
  belongs_to :color
  belongs_to :ordo
  belongs_to :rank
  belongs_to :season
  belongs_to :day_of_week
  
  validates :title, :data, :ordo_id, :rank_id, :season_id, :week_in_season, :day_of_week_id, :presence => true
  
  default_scope order("data ASC")
  
  resourcify
  
  def to_s
    "#{data} #{title}"
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |calendar|
        csv << calendar.attributes.values_at(*column_names)
      end
    end
  end
  
end
