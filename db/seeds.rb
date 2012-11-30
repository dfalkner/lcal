# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[ {code: 'sol', title:  'Solemnity'}, 
  {code: 'sun', title:  'Sunday'}, 
  {code: 'fst', title:  'Feast'},
  {code: 'mem', title:  'Memorial'}, 
  {code: 'opt', title:  'Optional Memorial'}, 
  {code: 'com', title:  'Commemoration'}, 
  {code: 'wd', title:  'Weekday'},
  {code: 'na', title:  'Not Applicable'}
].each {|i| Rank.find_or_create_by_code(i)}

[ {code: 'gen', title:  'General Calendar'}, 
  {code: 'us', title:  'United States of America'},
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