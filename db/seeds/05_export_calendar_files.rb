puts "\n\n05_export_calendar_files"

days_in_week = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
ofile = File.new("#{Rails.root}/db/seeds/cal_usa.json", "w")
cal = []
calendar = Calendar.all
calendar.each do |f|
  hash = { julian:f.data.strftime("%Y%j"), date:f.data, day:days_in_week[f.day_of_week], title:f.title, rank:Rank.find(f.rank_id).title, season:Season.find(f.season_id).title, color:Color.find(f.color_id).title, week_in_season:f.week_in_season  }
  cal << hash
end
ofile.write cal.to_json
ofile.close