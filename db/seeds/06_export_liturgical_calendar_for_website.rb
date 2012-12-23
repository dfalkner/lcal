puts "\n\n06_export_liturgical_calendar_for_website"
require 'CSV'
days_in_week = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
first_date = Date.new(2013, 1, 1)
last_date = Date.new(2013, 12, 31)
puts "Creating csv files with dates from #{first_date} to #{last_date}"

ofile = File.new("#{Rails.root}/db/seeds/cal_usa_#{first_date.year}.csv", "w")
ofile.write("date,season,week,week_day,color,rank,description\n")


cal = []
calendar = Calendar.where(data:first_date..last_date)
calendar.each do |f|
  season = Season.find(f.season_id).title
  if season == "Ordinary Time"
    season = "OrdinaryTime"
  end
  if season == "Holy Week"
    season = "Paschal"
  end
  
  color = Color.find(f.color_id).title.downcase!
  if color == "violet"
    color = "purple"
  end
    
 ofile.write("#{f.data.strftime("%Y%m%d")},#{season},w#{f.week_in_season},#{f.day_of_week},#{color},#{Rank.find(f.rank_id).title},\"#{f.title.chomp}\"\n")


end
ofile.close
