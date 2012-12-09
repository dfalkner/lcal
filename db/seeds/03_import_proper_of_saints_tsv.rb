puts "\n\n03_import_proper_of_saints_tsv"

commons = Common.all
feast_count = 0
feast_updates = 0

import_filename = "#{Rails.root}/db/seeds/03_proper-of-saints.tsv"
puts "Importing file #{import_filename}"
f = File.open(import_filename) 

f.each do |line| 
  
  line_part = line.split("\t")
  
  next if line_part[0]=='Ordo' # discard first line
  puts "importing #{line_part}"
  feast = Feast.find_or_create_by_title(line_part[4])
  puts "line_part[] #{line_part[0]} / #{line_part[1]} / #{line_part[2]} / #{line_part[4]}" if @debug >= 1

  ordo = Ordo.find_by_code(line_part[0])
  puts "#{ordo} = Ordo.find_by_code(#{line_part[0]})" if @debug >= 1

  feast.ordo = ordo

  feast.month = line_part[1].byteslice(0,2).to_i
  puts "month:#{feast.month} = #{line_part[1].byteslice(0,2)}.to_i" if @debug >= 1

  feast.day = line_part[1].byteslice(2,2).to_i
  puts "day:#{feast.day} = #{line_part[1].byteslice(2,2)}.to_i" if @debug >= 1

  rank = Rank.find_by_code(line_part[2])
  puts "rank:#{rank} = Rank.find_by_code(#{line_part[2]})" if @debug >= 1
  feast.rank=rank

  color = Color.find_by_title(line_part[3])
  puts "color:#{color} = Color.find_by_title(#{line_part[3]})" if @debug >= 1
  feast.color=color

  puts "title:#{line_part[4]}" if @debug >= 1
  feast.title=line_part[4]

  if feast.new_record?
    feast_count += 1
  else
    feast_updates += 1
  end
  if feast.valid?
    feast.save
  else
    puts "Feast #{line_part[4]} invalid. Did not get imported."
  end

  # add association with commons
  commons.each do |j|
  if feast.title =~ /.*\b#{j.code}\b.*/ 
    puts "#{feast.title} includes #{j.code}"  if @debug >= 1
    feast.commons << j
    feast.save
  end
end
end

puts "feasts imported #{feast_count} "
puts "feasts updated #{feast_updates}"


