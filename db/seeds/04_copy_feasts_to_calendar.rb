puts "\n\n\n\n\n\n-------------------------------"
puts "04_copy_feasts_to_calendar"
puts "-------------------------------\n\n"

@debug = 0

weekday_rank = Rank.find_by_code('wd')
sunday_rank = Rank.find_by_code('sun')
solemnity_rank = Rank.find_by_code('sol')
feast_rank = Rank.find_by_code('fst')
memorial_rank = Rank.find_by_code('mem')
optional_rank = Rank.find_by_code('opt')
obligatory_rank = Rank.find_by_code('obl')

general_ordo = Ordo.find_by_code('gen')
usa_ordo = Ordo.find_by_code('usa')

this_year = Date.today.year
start_year = Date.new(this_year - @years_into_past).year
end_year = Date.new(this_year + @years_into_future).year

feasts = Feast.all

start_year.upto end_year do |y|
  
  #add the principal celebrations to the calendar
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
  
  #add feast days to calendar
  feasts.each do |f|
    fday=Date.new(y, f.month, f.day)
    p fday if @debug == 1 
    puts "Checking to see if sol, sunday, or feast exists on #{fday}" if @debug == 1
    puts "f.ordo_id #{f.ordo_id}. general_ordo #{general_ordo}" if @debug == 1
    cal = Calendar.where(data:fday, ordo_id:[f.ordo_id, general_ordo], rank_id:[solemnity_rank,sunday_rank,feast_rank]).first
    puts "Found: #{cal}" if !cal.nil? && @debug == 1
    if !cal.nil?
        puts "Not adding special days because existing #{fday} has higher rank titled: #{cal.title}" if @debug >=1 
        next 
    end

=begin    
    cal = Calendar.where(data:fday, ordo_id:[f.ordo_id, general_ordo], rank_id:weekday_rank).first
    if cal.nil?
      puts "#{fday} with ordo_id:[f.ordo_id, general_ordo] and rank:weekday_rank) doesn't exist so creating" if @debug >=1 
      cal = Calendar.new()
    end
=end
    cal = Calendar.new()

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
    
#    if f.color_id != '' 
#      cal.color_id = f.color_id
#    end
    if !f.color_id.nil?
      cal.color_id = f.color_id
    end
    
    cal.week_in_season = Calendar.find_by_data(fday).week_in_season

    cal.day_of_week_id = fday.wday + 1
    cal.title = f.title
    
    puts "cal.valid? #{cal.valid?}" if @debug == 1
    if !cal.valid?
      puts "cal.valid? #{cal.valid?}" 
      p cal
    end
    cal.save

  
  end
end
