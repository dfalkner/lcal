puts "\n\n02_initialize_calendars_ferial_and_principals"

DAYNAMES = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)

this_year = Date.today.year
start_date = Date.new(this_year - @years_into_past)
end_date = Date.new(this_year + @years_into_future)

ordo = Ordo.find_by_code('gen')
puts "#{ordo} = Ordo.find_by_code(gen)" if @debug == 0

weekday_rank = Rank.find_by_code('wd')
sunday_rank = Rank.find_by_code('sun')
solemnity_rank = Rank.find_by_code('sol')
feast_rank = Rank.find_by_code('fst')
memorial_rank = Rank.find_by_code('mem')
optional_rank = Rank.find_by_code('opt')

start_date.upto end_date do |d|
  
  mary_mother_of_god = Date.new(d.year,1,1)
  epiphany = Principal.find_by_year(d.year).epiphany
  baptism_of_the_lord = Principal.find_by_year(d.year).baptism_of_the_lord
  ash_wed = Principal.find_by_year(d.year).ash_wednesday
  easter = Principal.find_by_year(d.year).easter
  pentecost = Principal.find_by_year(d.year).pentecost
  starting_week_of_ordinary_time_after_easter = Principal.find_by_year(d.year).starting_week_of_ordinary_time_after_easter
  holy_trinity = Principal.find_by_year(d.year).holy_trinity
  corpus_christi = Principal.find_by_year(d.year).corpus_christi
  sacred_heart = Principal.find_by_year(d.year).sacred_heart
  immaculate_heart = Principal.find_by_year(d.year).immaculate_heart
  
  thanksgiving = Date.new(d.year,11,1)
  thanksgiving = thanksgiving + [4,3,2,1,0,6,7].at(thanksgiving.wday) + 21
  
  first_sunday_of_advent = Principal.find_by_year(d.year).first_sunday_of_advent
  christmas = Date.new(d.year,12,25)
  
  holy_family = Date.new(d.year,12,26)
  while holy_family.wday != 0 and holy_family <= Date.new(d.year,12,30)
    holy_family += 1
  end
  
  
  title = ''
  
  cal = Calendar.new(data:d)
  cal.day_of_week = d.wday

  cal.ordo_id = ordo.id
  d.sunday? ? cal.rank_id = sunday_rank.id : cal.rank_id = weekday_rank.id
  cal.ordo_id if @debug == 1
  

  case d
  when mary_mother_of_god
    cal.rank_id = solemnity_rank.id
    cal.season_id = Season.find_by_code('xmas').id
    cal.color_id = Color.find_by_code('white').id
    cal.week_in_season = (d - (Date.new(d.year-1,12,25) - Date.new(d.year-1,12,25).wday) ).div(7) 
    title = "MARY, MOTHER OF GOD"
  when epiphany
    cal.rank_id = solemnity_rank.id
    cal.season_id = Season.find_by_code('xmas').id
    cal.color_id = Color.find_by_code('white').id
    cal.week_in_season = (d - (Date.new(d.year-1,12,25) - Date.new(d.year-1,12,25).wday) ).div(7) 
    title = "EPIPHANY"
  when baptism_of_the_lord
    cal.rank_id = feast_rank.id
    cal.season_id = Season.find_by_code('xmas').id
    cal.color_id = Color.find_by_code('white').id
    cal.week_in_season = (d - (Date.new(d.year-1,12,25) - Date.new(d.year-1,12,25).wday) ).div(7) 
    title = "Baptism of the Lord"
  when Date.new(d.year, 1, 1)..baptism_of_the_lord
    cal.season_id = Season.find_by_code('xmas').id
    cal.color_id = Color.find_by_code('white').id
    cal.week_in_season = (d - (Date.new(d.year-1,12,25) - Date.new(d.year-1,12,25).wday) ).div(7)  
  when (baptism_of_the_lord + 1)..(ash_wed - 1)
    cal.season_id = Season.find_by_code('ord').id
    cal.color_id = Color.find_by_code('green').id
    cal.week_in_season = (d - baptism_of_the_lord - baptism_of_the_lord.wday).div(7) + 1   
  when ash_wed 
    cal.season_id = Season.find_by_code('lent').id
    cal.color_id = Color.find_by_code('violet').id
    cal.week_in_season = 0
    title = "Ash Wednesday"    
  when ash_wed..(ash_wed + 3) #lent before Holy Week
    cal.season_id = Season.find_by_code('lent').id
    cal.color_id = Color.find_by_code('violet').id
    cal.week_in_season = 0
    title = "#{DAYNAMES[d.wday]} following Ash Wednesday"
   when (ash_wed + 4)..(easter-8) #lent before Holy Week
     cal.season_id = Season.find_by_code('lent').id
     cal.color_id = Color.find_by_code('violet').id
     cal.week_in_season = (d - ash_wed - 3).div(7) + 1
  when (easter-7) #Passion Sunday
    cal.rank_id = solemnity_rank.id
    cal.season_id = Season.find_by_code('hw').id
    cal.color_id = Color.find_by_code('red').id
    cal.week_in_season = (d - ash_wed - 3).div(7) + 1
    title = "PASSION SUNDAY"
 when (easter-6) #Holy Week Monday
   cal.season_id = Season.find_by_code('hw').id
   cal.color_id = Color.find_by_code('violet').id
   cal.week_in_season = (d - ash_wed - 3).div(7) + 1
   title = "#{DAYNAMES[d.wday]} of Holy Week"
  when (easter-5) #Holy Week Tuesday
    cal.season_id = Season.find_by_code('hw').id
    cal.color_id = Color.find_by_code('violet').id
    cal.week_in_season = (d - ash_wed - 3).div(7) + 1
    title = "#{DAYNAMES[d.wday]} of Holy Week"
  when (easter-4) #Holy Week Wednesday
    cal.season_id = Season.find_by_code('hw').id
    cal.color_id = Color.find_by_code('violet').id
    cal.week_in_season = (d - ash_wed - 3).div(7) + 1
    title = "#{DAYNAMES[d.wday]} of Holy Week"
  when (easter-3) #Holy Thursday
    cal.season_id = Season.find_by_code('hw').id
    cal.color_id = Color.find_by_code('white').id
    cal.week_in_season = (d - ash_wed - 3).div(7) + 1
    title = "Holy Thursday"
  when (easter-2) #Good Friday
    cal.season_id = Season.find_by_code('hw').id
    cal.color_id = Color.find_by_code('red').id
    cal.week_in_season = (d - ash_wed - 3).div(7) + 1
    title = "Good Friday"
  when (easter-1) #Holy Saturday
    cal.season_id = Season.find_by_code('hw').id
    cal.color_id = Color.find_by_code('violet').id
    cal.week_in_season = (d - ash_wed - 3).div(7) + 1
    title = "Holy Saturday"
 when (easter) 
   cal.rank_id = solemnity_rank.id
   cal.season_id = Season.find_by_code('east').id
   cal.color_id = Color.find_by_code('white').id
   cal.week_in_season =  1
   title = "EASTER SUNDAY"
  when (easter+1)..(easter+6) #easter octave 
    cal.season_id = Season.find_by_code('east').id
    cal.color_id = Color.find_by_code('white').id
    cal.week_in_season =  1
    title = "#{DAYNAMES[d.wday]} in the Octave of #{Season.find(cal.season_id).title}"
  when (easter+7)..(pentecost - 1) #easter season
   cal.season_id = Season.find_by_code('east').id
   cal.color_id = Color.find_by_code('white').id
   cal.week_in_season = (d - easter).div(7) + 1
  when pentecost 
    cal.rank_id = solemnity_rank.id
    cal.season_id = Season.find_by_code('east').id
    cal.color_id = Color.find_by_code('red').id
    cal.week_in_season = (d - easter).div(7) + 1
    title = "PENTECOST SUNDAY"
   when holy_trinity 
    cal.rank_id = solemnity_rank.id
    cal.season_id = Season.find_by_code('ord').id
    cal.color_id = Color.find_by_code('white').id
    cal.week_in_season =  (d - pentecost).div(7) + starting_week_of_ordinary_time_after_easter - 1
    title = "TRINITY SUNDAY"   
  when corpus_christi 
   cal.rank_id = solemnity_rank.id
   cal.season_id = Season.find_by_code('ord').id
   cal.color_id = Color.find_by_code('white').id
   cal.week_in_season =  (d - pentecost).div(7) + starting_week_of_ordinary_time_after_easter - 1
   title = "CORPUS CHRISTI"  
   when sacred_heart
    cal.rank_id = solemnity_rank.id
    cal.season_id = Season.find_by_code('ord').id
    cal.color_id = Color.find_by_code('white').id
    cal.week_in_season =  (d - pentecost).div(7) + starting_week_of_ordinary_time_after_easter - 1
    title = "SACRED HEART"
  when immaculate_heart
   cal.rank_id = memorial_rank.id
   cal.season_id = Season.find_by_code('ord').id
   cal.color_id = Color.find_by_code('white').id
   cal.week_in_season =  (d - pentecost).div(7) + starting_week_of_ordinary_time_after_easter - 1
   title = "Immaculate Heart of the BVM"
 when thanksgiving
  cal.rank_id = optional_rank.id
  cal.ordo_id = Ordo.find_by_code('usa').id
  cal.season_id = Season.find_by_code('ord').id
  cal.color_id = Color.find_by_code('green').id
  cal.week_in_season =  (d - pentecost).div(7) + starting_week_of_ordinary_time_after_easter - 1
  title = "Thanksgiving"
  when (pentecost+1)..(first_sunday_of_advent - 1) # Ordinary Time
   cal.season_id = Season.find_by_code('ord').id
   cal.color_id = Color.find_by_code('green').id
   cal.week_in_season =  (d - pentecost).div(7) + starting_week_of_ordinary_time_after_easter - 1
  when first_sunday_of_advent
   cal.season_id = Season.find_by_code('adv').id
   cal.color_id = Color.find_by_code('violet').id
   cal.week_in_season =  1
   title = "First Sunday of Advent"
  when first_sunday_of_advent + 7
   cal.season_id = Season.find_by_code('adv').id
   cal.color_id = Color.find_by_code('violet').id
   cal.week_in_season =  2
   title = "Secound Sunday of Advent"
  when first_sunday_of_advent + 14
   cal.season_id = Season.find_by_code('adv').id
   cal.color_id = Color.find_by_code('violet').id
   cal.week_in_season =  3
   title = "Gaudete Sunday of Advent"
  when first_sunday_of_advent..(christmas - 1)
   cal.season_id = Season.find_by_code('adv').id
   cal.color_id = Color.find_by_code('violet').id
   cal.week_in_season =  (d - first_sunday_of_advent).div(7) + 1
   when first_sunday_of_advent + 21
    cal.season_id = Season.find_by_code('adv').id
    cal.color_id = Color.find_by_code('violet').id
    cal.week_in_season =  4
    title = "Forth Sunday of Advent"
  when christmas
   cal.rank_id = solemnity_rank.id 
   cal.season_id = Season.find_by_code('xmas').id
   cal.color_id = Color.find_by_code('white').id
   cal.week_in_season = 0
   title = "CHRISTMAS"
  when holy_family
   cal.rank_id = feast_rank.id 
   cal.season_id = Season.find_by_code('xmas').id
   cal.color_id = Color.find_by_code('white').id
   cal.week_in_season = 0
   title = "HOLY FAMILY"
  when (christmas + 1)..Date.new(d.year, 12, 31)
   cal.season_id = Season.find_by_code('xmas').id
   cal.color_id = Color.find_by_code('white').id
   cal.week_in_season =  1
  else
     puts "NOTHING SHOULD BE HERE"
  end

  if title == ''
    cal.title = "#{DAYNAMES[d.wday]} in the #{(cal.week_in_season.to_i).en.ordinal} Week of #{Season.find(cal.season_id).title}"
  else
    cal.title = title
  end
  p cal if @debug == 1
  
  if !cal.valid?
    puts "#{cal} cal.valid? #{cal.valid?}"
  end
  cal.save

  
end