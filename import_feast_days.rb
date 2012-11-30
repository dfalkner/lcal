require 'CSV'

import_file = 'proper-of-saints-v4.csv'
puts "importing #{import_file}"
feasts = CSV.read(import_file)
debug = 1
p feasts if debug == 1

count = 0

feasts.each do |i|
  next if i[0] == 'Ordo' #indicates this is the header row
  
  rom_cal = RomanCalendar.new()
  
  ordo = Ordo.find_by_code(i[0])
  puts "#{ordo} = Ordo.find_by_code(#{i[0]})" if debug == 1
  rom_cal.ordo = ordo
  
  puts "rom_cal.feast_day = #{i[1]}" if debug == 1
  rom_cal.feast_day = i[1]
  
  rank = Rank.find_by_code(i[2])
  puts "#{rank} = Rank.find_by_code(#{i[2]})" if debug == 1
  rom_cal.rank=rank
  
  color = Color.find_by_title(i[3])
  puts "#{color} = Color.find_by_title(#{i[3]})" if debug == 1
  rom_cal.color=color
  
  puts "rom_cal.title=#{i[4]})" if debug == 1
  rom_cal.title=i[4]
  
  if rom_cal.valid?   
    rom_cal.save
    count += 1
    puts "Count:#{count}"
  end
end
=begin
values.each do |i|
  
  rank_id = ['Solemnity', 'Sunday', 'Feast', 'Memorial', 'Opt. Mem.','Commem.', 'Weekday'].index
  puts "rank_id #{rank_id}"
  
  rom_cal = RomanCalendar.new(feast_day: i['Date'], rank_id:i[rank_id], color:i['Color'], description:i['Description'])
  rom_cal.save

  
end
  rank_id = ['Solemnity', 'Sunday', 'Feast', 'Memorial', 'Opt. Mem.','Commem.', 'Weekday'].index(i[2])
=end
