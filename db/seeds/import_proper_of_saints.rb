
  import_file = "#{Rails.root}/db/seeds/proper-of-saints.csv"

  puts "importing #{import_file}"
  @feasts = CSV.read(import_file)
  debug = 0
  # p @feasts if debug == 1

  commons = Common.all
  count = 0

  @feasts.each do |i|
    next if i[0] == 'Ordo' #indicates this is the header row
  
    feast = Feast.new()
    puts "feast = #{feast}"  if debug == 1

    ordo = Ordo.find_by_code(i[0])
    puts "#{ordo} = Ordo.find_by_code(#{i[0]})" if debug == 1
  
    feast.ordo = ordo
  
    feast.month = i[1].byteslice(0,2).to_i
    puts "#{feast.month} = #{i[1].byteslice(0,2)}.to_i" if debug == 1
  
    feast.day = i[1].byteslice(2,2).to_i
    puts "#{feast.day} = #{i[1].byteslice(2,2)}.to_i" if debug == 1
  
    rank = Rank.find_by_code(i[2])
    puts "#{rank} = Rank.find_by_code(#{i[2]})" if debug == 1
    feast.rank=rank
  
    color = Color.find_by_title(i[3])
    puts "#{color} = Color.find_by_title(#{i[3]})" if debug == 1
    feast.color=color
  
    puts "feast.title=#{i[4]})" if debug == 1
    feast.title=i[4]
  
    feast.save
  
    # add association with commons
    commons.each do |j|
      if feast.title =~ /.*\b#{j.code}\b.*/ 
        puts "#{feast.title} includes #{j.code}"
        feast.commons << j
        feast.save
      end
    end
end

