principal = Principal.all
principal.each do |p|
  puts p.year
  #epiphany
  cal = Calendar.find_or_create_by_data(p.epiphany)
  cal.ordo_id = Ordo.find_by_code('gen').id
  cal.rank_id = Rank.find_by_code('sol').id
  cal.season_id = Season.find_by_code('xmas').id
  cal.color_id = Color.find_by_code('white').id
  cal.week_in_season = 2
  cal.day_of_week = cal.data.wday
  cal.title = "Epiphany"
  cal.save
  
  #baptism of the lord
  cal = Calendar.find_or_create_by_data(p.baptism_of_the_lord)
  cal.ordo_id = Ordo.find_by_code('gen').id
  cal.rank_id = Rank.find_by_code('fst').id
  cal.season_id = Season.find_by_code('xmas').id
  cal.color_id = Color.find_by_code('white').id
  cal.week_in_season = 1 + cal.data.cweek 
  cal.day_of_week = cal.data.wday
  cal.title = "Baptism of the Lord"
  cal.save
    
  #ash_wednesday
  cal = Calendar.find_or_create_by_data(p.ash_wednesday)
  cal.ordo_id = Ordo.find_by_code('gen').id
  cal.rank_id = Rank.find_by_code('fst').id
  cal.season_id = Season.find_by_code('lent').id
  cal.color_id = Color.find_by_code('violet').id
  cal.week_in_season = 0 
  cal.day_of_week = cal.data.wday
  cal.title = "Ash Wednesday"
  cal.save
  
  cal = Calendar.find_or_create_by_data(p.easter-7)
  cal.ordo_id = Ordo.find_by_code('gen').id
  cal.rank_id = Rank.find_by_code('sun').id
  cal.season_id = Season.find_by_code('hw').id
  cal.color_id = Color.find_by_code('red').id
  cal.week_in_season = 0 
  cal.day_of_week = cal.data.wday
  cal.title = "Passion Sunday"
  cal.save
  
  cal = Calendar.find_or_create_by_data(p.easter-6)
  cal.ordo_id = Ordo.find_by_code('gen').id
  cal.rank_id = Rank.find_by_code('mem').id
  cal.season_id = Season.find_by_code('hw').id
  cal.color_id = Color.find_by_code('violet').id
  cal.week_in_season = 0 
  cal.day_of_week = cal.data.wday
  cal.title = "Monday of Holy Week"
  cal.save
  
  cal = Calendar.find_or_create_by_data(p.easter-5)
  cal.ordo_id = Ordo.find_by_code('gen').id
  cal.rank_id = Rank.find_by_code('mem').id
  cal.season_id = Season.find_by_code('hw').id
  cal.color_id = Color.find_by_code('violet').id
  cal.week_in_season = 0 
  cal.day_of_week = cal.data.wday
  cal.title = "Tuesday of Holy Week"
  cal.save
  
  cal = Calendar.find_or_create_by_data(p.easter-4)
  cal.ordo_id = Ordo.find_by_code('gen').id
  cal.rank_id = Rank.find_by_code('mem').id
  cal.season_id = Season.find_by_code('hw').id
  cal.color_id = Color.find_by_code('violet').id
  cal.week_in_season = 0 
  cal.day_of_week = cal.data.wday
  cal.title = "Wednesday of Holy Week"
  cal.save
  
  cal = Calendar.find_or_create_by_data(p.easter-3)
  cal.ordo_id = Ordo.find_by_code('gen').id
  cal.rank_id = Rank.find_by_code('mem').id
  cal.season_id = Season.find_by_code('hw').id
  cal.color_id = Color.find_by_code('white').id
  cal.week_in_season = 0 
  cal.day_of_week = cal.data.wday
  cal.title = "Holy Thursday"
  cal.save
  
  cal = Calendar.find_or_create_by_data(p.easter-2)
  cal.ordo_id = Ordo.find_by_code('gen').id
  cal.rank_id = Rank.find_by_code('mem').id
  cal.season_id = Season.find_by_code('hw').id
  cal.color_id = Color.find_by_code('red').id
  cal.week_in_season = 0 
  cal.day_of_week = cal.data.wday
  cal.title = "Good Friday"
  cal.save
  
  cal = Calendar.find_or_create_by_data(p.easter-1)
  cal.ordo_id = Ordo.find_by_code('gen').id
  cal.rank_id = Rank.find_by_code('mem').id
  cal.season_id = Season.find_by_code('hw').id
  cal.color_id = Color.find_by_code('violet').id
  cal.week_in_season = 0 
  cal.day_of_week = cal.data.wday
  cal.title = "Holy Saturday"
  cal.save
    
  #easter
  cal = Calendar.find_or_create_by_data(p.easter)
  cal.ordo_id = Ordo.find_by_code('gen').id
  cal.rank_id = Rank.find_by_code('sol').id
  cal.season_id = Season.find_by_code('east').id
  cal.color_id = Color.find_by_code('white').id
  cal.week_in_season = 0 
  cal.day_of_week = cal.data.wday
  cal.title = "Easter Sunday"
  cal.save

  #ascension
  cal = Calendar.find_or_create_by_data(p.ascension)
  cal.ordo_id = Ordo.find_by_code('gen').id
  cal.rank_id = Rank.find_by_code('sol').id
  cal.season_id = Season.find_by_code('east').id
  cal.color_id = Color.find_by_code('white').id
  cal.week_in_season = 6 
  cal.day_of_week = cal.data.wday
  cal.title = "Ascension"
  cal.save
  
  #ascension_sunday
  cal = Calendar.find_or_create_by_data(p.ascension_sunday)
  cal.ordo_id = Ordo.find_by_code('usa')
  cal.rank_id = Rank.find_by_code('sol').id
  cal.season_id = Season.find_by_code('east').id
  cal.color_id = Color.find_by_code('white').id
  cal.week_in_season = 7 
  cal.day_of_week = cal.data.wday
  cal.title = "Ascension Sunday"
  cal.save  
  
  # pentecost
  cal = Calendar.find_or_create_by_data(p.pentecost)
  cal.ordo_id = Ordo.find_by_code('gen').id
  cal.rank_id = Rank.find_by_code('sol').id
  cal.season_id = Season.find_by_code('east').id
  cal.color_id = Color.find_by_code('red').id
  cal.week_in_season = 8
  cal.day_of_week = cal.data.wday
  cal.title = "Pentecost"
  cal.save
  
  #holy_trinity
  cal = Calendar.find_or_create_by_data(p.holy_trinity)
  cal.ordo_id = Ordo.find_by_code('gen').id
  cal.rank_id = Rank.find_by_code('sol').id
  cal.season_id = Season.find_by_code('ord').id
  cal.color_id = Color.find_by_code('green').id
  cal.week_in_season = p.starting_week_of_ordinary_time_after_easter + 1
  cal.day_of_week = cal.data.wday
  cal.title = "Holy Trinity"
  cal.save
  
  #corpus_christi
  cal = Calendar.find_or_create_by_data(p.corpus_christi)
  cal.ordo_id = Ordo.find_by_code('gen').id
  cal.rank_id = Rank.find_by_code('sol').id
  cal.season_id = Season.find_by_code('ord').id
  cal.color_id = Color.find_by_code('white').id
  cal.week_in_season = p.starting_week_of_ordinary_time_after_easter + 1
  cal.day_of_week = cal.data.wday
  cal.title = "Corpus Christy"
  cal.save
  
  #sacred_heart
  cal = Calendar.find_or_create_by_data(p.sacred_heart)
  cal.ordo_id = Ordo.find_by_code('gen').id
  cal.rank_id = Rank.find_by_code('sol').id
  cal.season_id = Season.find_by_code('ord').id
  cal.color_id = Color.find_by_code('white').id
  cal.week_in_season = p.starting_week_of_ordinary_time_after_easter + 3
  cal.day_of_week = cal.data.wday
  cal.title = "Sacred Heart of our Lord"
  cal.save
  
  #immaculate_heart
  cal = Calendar.find_or_create_by_data(p.immaculate_heart)
  cal.ordo_id = Ordo.find_by_code('gen').id
  cal.rank_id = Rank.find_by_code('mem').id
  cal.season_id = Season.find_by_code('ord').id
  cal.color_id = Color.find_by_code('white').id
  cal.week_in_season = p.starting_week_of_ordinary_time_after_easter + 3
  cal.day_of_week = cal.data.wday
  cal.title = "Immaculate Heart of Mary"
  cal.save
  
  #first_sunday_of_advent
  cal = Calendar.find_or_create_by_data(p.first_sunday_of_advent)
  cal.ordo_id = Ordo.find_by_code('gen').id
  cal.rank_id = Rank.find_by_code('sun').id
  cal.season_id = Season.find_by_code('adv').id
  cal.color_id = Color.find_by_code('violet').id
  cal.week_in_season = 1
  cal.day_of_week = cal.data.wday
  cal.title = "First Sunday of Advent"
  cal.save
  
  #second sunday_of_advent
  cal = Calendar.find_or_create_by_data(p.first_sunday_of_advent+7)
  cal.ordo_id = Ordo.find_by_code('gen').id
  cal.rank_id = Rank.find_by_code('sun').id
  cal.season_id = Season.find_by_code('adv').id
  cal.color_id = Color.find_by_code('violet').id
  cal.week_in_season = 2
  cal.day_of_week = cal.data.wday
  cal.title = "Second Sunday of Advent"
  cal.save

  #third sunday_of_advent
  cal = Calendar.find_or_create_by_data(p.first_sunday_of_advent+14)
  cal.ordo_id = Ordo.find_by_code('gen').id
  cal.rank_id = Rank.find_by_code('sun').id
  cal.season_id = Season.find_by_code('adv').id
  cal.color_id = Color.find_by_code('violet').id
  cal.week_in_season = 3
  cal.day_of_week = cal.data.wday
  cal.title = "Gaudete Sunday (Third Sunday of Advent)"
  cal.save

  #fourth sunday_of_advent
  cal = Calendar.find_or_create_by_data(p.first_sunday_of_advent+21)
  cal.ordo_id = Ordo.find_by_code('gen').id
  cal.rank_id = Rank.find_by_code('sun').id
  cal.season_id = Season.find_by_code('adv').id
  cal.color_id = Color.find_by_code('violet').id
  cal.week_in_season = 4
  cal.day_of_week = cal.data.wday
  cal.title = "Fourth Sunday of Advent"
  cal.save
 
  #christmas
  christmas = Date.new(p.year, 12, 25)
  cal = Calendar.find_or_create_by_data(christmas)
  cal.ordo_id = Ordo.find_by_code('gen').id
  cal.rank_id = Rank.find_by_code('sol').id
  cal.season_id = Season.find_by_code('xmas').id
  cal.color_id = Color.find_by_code('white').id
  cal.week_in_season = 0
  cal.day_of_week = cal.data.wday
  cal.title = "CHRISTMAS"
  cal.save

  
  end
