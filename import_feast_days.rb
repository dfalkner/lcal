require 'CSV'

import_file = 'proper-of-saints-v4.csv'
puts "importing #{import_file}"
@feasts = CSV.read(import_file)
debug = 0
p @feasts if debug == 1

commons = Common.all
count = 0

@feasts.each do |i|
  next if i[0] == 'Ordo' #indicates this is the header row
  
  feast = Feast.new()

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
  
  commons.each do |j|
    if feast.title =~ /.*\b#{j.code}\b.*/ 
      puts "#{feast.title} includes #{j.code}"
      feast.commons << j
      feast.save
    end
  end
  
#  feast.save

end
=begin
# build associations between Commons and Feasts. The title field will contain zero to two Common.code
commons = Common.all
common_codes = []
commons.each do |i|
  common_codes << i.code
end


@feasts = Feast.all
@feasts.each do |rc|
  
  if rc.title ~= /.*\bAb\b.*/
    crc = CommonsRomanCal
    
  end
  
  if rc.title ~= /.*\bA\b.*/
    
  end
    
  if rc.title ~= /.*\bBb\b.*/
    
  end
  
  if rc.title ~= /.*\bB\b.*/
    
  end
  if rc.title ~= /.*\bBVM\b.*/
    
  end
  if rc.title ~= /.*\bDd\b.*/
    
  end
  if rc.title ~= /.*\bD\b.*/
    
  end
  if rc.title ~= /.*\bDed\b.*/
    
  end
  if rc.title ~= /.*\bHM\b.*/
    
  end
  if rc.title ~= /.*\bHW\b.*/
    
  end
  if rc.title ~= /.*\bMm\b.*/
    
  end
  if rc.title ~= /.*\bM\b.*/
    
  end
  if rc.title ~= /.*\bPp\b.*/
    
  end
  if rc.title ~= /.*\bP\b.*/
    
  end
  if rc.title ~= /.*\bPas\b.*/
    
  end
  if rc.title ~= /.*\bPo\b.*/
    
  end
  if rc.title ~= /.*\bRel\b.*/
    
  end
  if rc.title ~= /.*\bTea\b.*/
    
  end
  if rc.title ~= /.*\bUnderpriv\b.*/
    
  end
  if rc.title ~= /.*\bVv\b.*/
    
  end
  if rc.title ~= /.*\bV\b.*/
    
  end


end
=end