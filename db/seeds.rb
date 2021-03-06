# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Linguistics.use(:en)

@years_into_future = 6 #number of years of data to create
@years_into_past = 0

@debug = 0

if Role.find_by_name('admin').nil?
  puts 'CREATING ROLES'
  Role.create([
    { :name => 'admin' }, 
    { :name => 'user' }, 
    { :name => 'editor' }
  ], :without_protection => true)
  puts 'SETTING UP DEFAULT USER LOGIN'
  user = User.create! :name => 'Dane', :email => 'dfalkner@divineoffice.org', :password => 'password', :password_confirmation => 'password'
  user.add_role :admin
  user.add_role :editor  
  puts 'New user created: ' << user.name
  
  user2 = User.create! :name => 'Monica', :email => 'monica@surgeworks.com', :password => 'password', :password_confirmation => 'password'
  puts 'New user created: ' << user2.name
  user2.add_role :editor
  
  user3 = User.create! :name => 'Mauro', :email => 'mauro.dalu@surgeworks.com', :password => 'password', :password_confirmation => 'password'
  puts 'New user created: ' << user3.name
  user3.add_role :admin
  user3.add_role :editor
  
  user4 = User.create! :name => 'Nicole', :email => 'nicole.turiano@surgeworks.com', :password => 'password', :password_confirmation => 'password'
  puts 'New user created: ' << user4.name
  user4.add_role :editor
  
end

[ {code: 'sol', position: 0, title:  'Solemnity'}, 
  {code: 'sun', position: 1, title:  'Sunday'}, 
  {code: 'fst', position: 2, title:  'Feast'},
  {code: 'obl', position: 3, title:  'Obligatory Mem.'},
  {code: 'mem', position: 4, title:  'Memorial'}, 
  {code: 'wd', position: 5, title:  'Weekday'},
  {code: 'opt', position: 6, title:  'Opt. Mem.'}, 
  {code: 'com', position: 7, title:  'Commem.'}, 
  {code: 'na', position: 9, title:  'Not Applicable'}
].each {|i| Rank.find_or_create_by_code(i, :without_protection => true)}

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
  {code: 'pr', title:  'Puerto Rico'}, 
  {code: 'pt', title:  'Portugal'}, 
  {code: 'scot', title:  'Scotland'},
  {code: 'sk', title:  'Slovakia'},
  {code: 'es', title:  'Spain'}, 
  {code: 'lk', title:  'Sri Lanka'}, 
  {code: 'vn', title:  'Vietnam'},
  {code: 'wal', title:  'Wales'}
].each {|i| Ordo.find_or_create_by_code(i, :without_protection => true)}

[ {code: 'ord', title:  'Ordinary Time'}, 
  {code: 'adv', title:  'Advent'}, 
  {code: 'xmas', title:  'Christmas'},
  {code: 'lent', title:  'Lent'}, 
  {code: 'hw', title:  'Holy Week'}, 
  {code: 'east', title:  'Easter'}, 
  {code: 'any', title:  'Any Season'},
  {code: 'na', title:  'Not Applicable'}
].each {|i| Season.find_or_create_by_code(i, :without_protection => true)}

[ {code: 'sun', title:  'Sunday'}, 
  {code: 'mon', title:  'Monday'}, 
  {code: 'tue', title:  'Tuesday'},
  {code: 'wed', title:  'Wednesday'}, 
  {code: 'thu', title:  'Thursday'}, 
  {code: 'fri', title:  'Friday'}, 
  {code: 'sat', title:  'Saturday'} 
].each {|i| DayOfWeek.find_or_create_by_code(i, :without_protection => true)}


[ {code: 'green', title:  'Green'}, 
  {code: 'violet', title:  'Violet'}, 
  {code: 'white', title:  'White'},
  {code: 'red', title:  'Red'}, 
  {code: 'black', title:  'Black'}
].each {|i| Color.find_or_create_by_code(i, :without_protection => true)}

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
].each {|i| Common.find_or_create_by_code(i, :without_protection => true)}


load("#{Rails.root}/db/seeds/01_import_principal_celebrations.rb")

load("#{Rails.root}/db/seeds/02_initialize_calendars_ferial_and_principals.rb")


load("#{Rails.root}/db/seeds/03a_import_proper_of_saints_tsv.rb")

load("#{Rails.root}/db/seeds/03b_import_proper_of_saints_other_ordos_tsv.rb")

load("#{Rails.root}/db/seeds/04_copy_feasts_to_calendar.rb")

=begin
load("#{Rails.root}/db/seeds/05_export_calendar_files.rb")

load("#{Rails.root}/db/seeds/06_export_liturgical_calendar_for_website.rb")
=end



