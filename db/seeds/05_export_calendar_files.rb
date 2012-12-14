puts "\n\n05_export_calendar_files"

days_in_week = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
ofile = File.new("#{Rails.root}/db/seeds/cal_usa.json", "w")
cal = []
title = ''
calendar = Calendar.all
calendar.each do |f|
  
  if Rank.find(f.rank_id).code == 'wd'
    title = "#{f.title.chomp}. Color: #{Color.find(f.color_id).title}"
  else
    title = "#{Rank.find(f.rank_id).title}: #{f.title.chomp}. Color: #{Color.find(f.color_id).title}"
  end
  
  hash = { date:f.data.strftime("%Y%m%d"), position:Rank.find(f.rank_id).position, title:title, rank:Rank.find(f.rank_id).title, color:Color.find(f.color_id).title, ordo:Ordo.find(f.ordo_id).code }
  cal << hash
end
ofile.write cal.to_json
ofile.close

