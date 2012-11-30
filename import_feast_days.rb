require 'CSV'
feasts = CSV.read('proper-of-saints-v4.csv')

feasts.each do |i|
  next if i[0] == 'Ordo' 
  rank = Rank.find_by_code(i[2])
  puts "#{rank} = Rank.find_by_code(#{i[2]})"
  ordo = Ordo.find_by_code(i[0])
  puts "#{ordo} = Ordo.find_by_code(#{i[0]})"

  rom_cal = RomanCalendar.new()
  puts "rom_cal.ordo = #{ordo}"
  rom_cal.ordo = ordo
  puts "rom_cal.feast_day = #{i[1]}"
  rom_cal.feast_day = i[1]
  puts "rom_cal.rank=#{rank}"
  rom_cal.rank=rank
  puts "rom_cal.color=#{i[3]}"
  rom_cal.color=i[3]
  puts "rom_cal.description=#{i[4]})"
  rom_cal.description=i[4]
  rom_cal.save
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
