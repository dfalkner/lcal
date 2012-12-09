# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Linguistics.use(:en)

@years_into_future = 5 #number of years of data to create
@years_into_past = 1

@debug = 1

if !(User.exists?(name: "Dane Falkner"))
  admin = User.create!(name:     "Dane Falkner",
                       email:    "dfalkner@divineoffice.org",
                       password: "g00dw0rks",
                       password_confirmation: "g00dw0rks"
                       )                              
  admin.toggle!(:admin)
  admin.toggle!(:editor)
  puts "Added admin user"
end

[ {code: 'sol', position: 1, title:  'Solemnity'}, 
  {code: 'sun', position: 2, title:  'Sunday'}, 
  {code: 'fst', position: 3, title:  'Feast'},
  {code: 'mem', position: 4, title:  'Memorial'}, 
  {code: 'opt', position: 5, title:  'Optional Memorial'}, 
  {code: 'com', position: 6, title:  'Commemoration'}, 
  {code: 'wd', position: 7, title:  'Weekday'},
  {code: 'na', position: 9, title:  'Not Applicable'}
].each {|i| Rank.find_or_create_by_code(i)}

[ {code: 'gen', title:  'General Calendar'}, 
  {code: 'usa', title:  'United States of America'},
  {code: 'usaa', title:  'United States of America Anglican'}, 
  {code: 'ar', title:  'Argentina'}, 
  {code: 'br', title:  'Brazil'}, 
  {code: 'au', title:  'Australia'},
  {code: 'ca', title:  'Canada'},
  {code: 'cl', title:  'Chile'}, 
  {code: 'hr', title:  'Croatia'}, 
  {code: 'eng', title:  'England'},
  {code: 'gr', title:  'Greece'},
  {code: 'ie', title:  'Ireland'}, 
  {code: 'lb', title:  'Lebanon'}, 
  {code: 'mt', title:  'Malta'},
  {code: 'nz', title:  'New Zealand'},
  {code: 'ph', title:  'Philippines'}, 
  {code: 'pt', title:  'Portugal'}, 
  {code: 'scot', title:  'Scotland'},
  {code: 'sk', title:  'Slovakia'},
  {code: 'es', title:  'Spain'}, 
  {code: 'lk', title:  'Sri Lanka'}, 
  {code: 'vn', title:  'Vietnam'},
  {code: 'wal', title:  'Wales'}
].each {|i| Ordo.find_or_create_by_code(i)}

[ {code: 'ord', title:  'Ordinary Time'}, 
  {code: 'adv', title:  'Advent'}, 
  {code: 'xmas', title:  'Christmas'},
  {code: 'lent', title:  'Lent'}, 
  {code: 'hw', title:  'Holy Week'}, 
  {code: 'east', title:  'Easter'}, 
  {code: 'any', title:  'Any Season'},
  {code: 'na', title:  'Not Applicable'}
].each {|i| Season.find_or_create_by_code(i)}

[ {code: 'green', title:  'Green'}, 
  {code: 'violet', title:  'Violet'}, 
  {code: 'white', title:  'White'},
  {code: 'red', title:  'Red'}, 
  {code: 'black', title:  'Black'}
].each {|i| Color.find_or_create_by_code(i)}

[ {code: 'none', title:  ' '}, 
  {code: 'Ab', title:  'Abbot'}, 
  {code: 'B', title:  'Bishop'},
  {code: 'Bb', title:  'Bishops'}, 
  {code: 'BVM', title:  'Blessed Virgin Mary'},
  {code: 'D', title:  'Doctor of the Church'},
  {code: 'Dd', title:  'Doctors of the Church'},
  {code: 'De', title:  'Deacon'},
  {code: 'Ded', title:  'Dedication of Church'},
  {code: 'HM', title:  'Holy Men'},
  {code: 'HW', title:  'Holy Women'},
  {code: 'M', title:  'Martyr'},
  {code: 'Mm', title:  'Martyrs'},
  {code: 'P', title:  'Priest'},
  {code: 'Pp', title:  'Priests'},
  {code: 'Pas', title:  'Pastor'},
  {code: 'Po', title:  'Pope'},
  {code: 'Rel', title:  'Religious'},
  {code: 'Tea', title:  'Teacher'},
  {code: 'Underpriv', title:  'Those who work for underpivileged'},
  {code: 'V', title:  'Virgin'},
  {code: 'Vv', title:  'Virgins'}
].each {|i| Common.find_or_create_by_code(i)}


load("#{Rails.root}/db/seeds/import_principal_celebrations.rb")

load("#{Rails.root}/db/seeds/initialize_calendars_ferial_and_principals.rb")

load("#{Rails.root}/db/seeds/import_proper_of_saints.rb")


# next need to add saint days to calendar

#create_table "calendars", :force => true do |t|
#  t.integer  "ordo_id"
#  t.date     "data"
#  t.integer  "rank_id"
#  t.integer  "season_id"
#  t.integer  "color_id"
#  t.integer  "week_in_season"
#  t.string   "day_of_week"
#  t.string   "title"
  
#create_table "feasts", :force => true do |t|
#  t.integer  "ordo_id"
#  t.integer  "month"
#  t.integer  "day"
#  t.integer  "rank_id"
#  t.integer  "color_id"
#  t.string   "title"

weekday_rank = Rank.find_by_code('wd')
sunday_rank = Rank.find_by_code('sun')
solemnity_rank = Rank.find_by_code('sol')
feast_rank = Rank.find_by_code('fst')
memorial_rank = Rank.find_by_code('mem')
optional_rank = Rank.find_by_code('opt')



general_ordo = Ordo.find_by_code('gen')
usa_ordo = Ordo.find_by_code('usa')

this_year = Date.today.year
start_year = Date.new(this_year - @years_into_past).year
end_year = Date.new(this_year + @years_into_future).year

feasts = Feast.all

start_year.upto end_year do |y|
  
  epiphany = Principal.find_by_year(y).epiphany
  baptism_of_the_lord = Principal.find_by_year(y).baptism_of_the_lord
  ash_wednesday = Principal.find_by_year(y).ash_wednesday
  easter = Principal.find_by_year(y).easter
  pentecost = Principal.find_by_year(y).pentecost
  starting_week_of_ordinary_time_after_easter = Principal.find_by_year(y).starting_week_of_ordinary_time_after_easter
  holy_trinity = Principal.find_by_year(y).holy_trinity
  corpus_christi = Principal.find_by_year(y).corpus_christi
  sacred_heart = Principal.find_by_year(y).sacred_heart
  immaculate_heart = Principal.find_by_year(y).immaculate_heart
  first_sunday_of_advent = Principal.find_by_year(y).first_sunday_of_advent
  christmas = Date.new(y,12,25)
  
  
  feasts.each do |f|
    fday=Date.new(y, f.month, f.day)
    cal = Calendar.where(data:fday, ordo_id:[f.ordo_id, general_ordo], rank_id:[solemnity_rank,sunday_rank,feast_rank]).first
    if !cal.nil?
        puts "Skipping existing #{fday} which has higher rank titled: #{cal.title}" if @debug >=1 
        next 
    end
    cal = Calendar.where(data:fday, ordo_id:[f.ordo_id, general_ordo], rank_id:weekday_rank).first
    if cal.nil?
      puts "#{fday} with ordo_id:[f.ordo_id, general_ordo] and rank:weekday_rank) doesn't exist so creating" if @debug >=1 
      cal = Calendar.new()
    end

    p fday if @debug >=1 
    
    case fday
    when Date.new(y,1,2)..baptism_of_the_lord
      cal.season_id = Season.find_by_code('xmas').id
      cal.color_id = Color.find_by_code('white').id
    when (baptism_of_the_lord+1)..(ash_wednesday-1)
      cal.season_id = Season.find_by_code('ord').id
      cal.color_id = Color.find_by_code('green').id
    when (ash_wednesday)..(easter-1)
      cal.season_id = Season.find_by_code('lent').id
      cal.color_id = Color.find_by_code('violet').id
    when easter..pentecost
      cal.season_id = Season.find_by_code('east') .id 
      cal.color_id = Color.find_by_code('white').id
    when (pentecost+1)..(first_sunday_of_advent - 1)
      cal.season_id = Season.find_by_code('ord').id
      cal.color_id = Color.find_by_code('green').id
    when (first_sunday_of_advent)..(christmas - 1)
      cal.season_id = Season.find_by_code('adv').id
      cal.color_id = Color.find_by_code('violet').id
    when christmas..Date.new(y,12,31)
      cal.season_id = Season.find_by_code('xmas').id
      cal.color_id = Color.find_by_code('white').id
    else
      puts "#{fday} should not get here"
    end
    cal.ordo_id = f.ordo_id
    cal.data = fday
    cal.rank_id = f.rank_id
    
    if f.color_id != '' 
      cal.color_id = f.color_id
    end
    
  #  cal.week_in_season = Calendar.find_by_data(fday).week_in_season
    cal.day_of_week = fday.wday
    cal.title = f.title
    
    if !cal.valid?
      puts "cal.valid?#{cal.valid?}" 
      p cal
    end
    cal.save

  
  end
end




# load("#{Rails.root}/db/seeds/load_calendar_with_principal_celebrations.rb")

