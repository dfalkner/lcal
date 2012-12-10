puts "\n\n01_import_principal_celebrations"

#============== Principal Celebrations ======

def easter(y)
  # ==========================================
  # Determin Easter Date for any given year based on http://www.assa.org.au/edm.html#Computer
  # ==========================================  
  first_digit, remainder, temp, t_a, t_b, t_c, t_d, t_e = 0, 0, 0, 0, 0, 0, 0, 0

  first_digit = y / 100 #first 2 digits of year 
  remainder_19 = y.modulo(19) #remainder of year / 19

  # calculate PFM (Pascal Full Moon) date 
  temp = (first_digit - 15) / 2 + 202 - 11 * remainder_19 

  case first_digit 
  when 21, 24, 25, 27..32, 34, 35, 38 
    temp = temp - 1 
  when 33, 36, 37, 39, 40 
    temp = temp - 2 
  end

  temp = temp.modulo(30)

  t_a = temp + 21 
  t_a = t_a - 1 if temp == 29
  t_a = t_a - 1 if (temp == 28 and remainder_19 > 10)

  #find the next Sunday 
  t_b = (t_a - 19).modulo(7)

  t_c = (40 - first_digit).modulo(4) 
  t_c = t_c + 1 if t_c == 3  
  t_c = t_c + 1 if t_c > 1  

  temp = y.modulo(100) 
  t_d = (temp + temp / 4).modulo(7) 

  t_e = ((20 - t_b - t_c - t_d).modulo(7)) + 1 
  d = t_a + t_e 

  #return the date 
  if d > 31 then 
    d = d - 31 
    m = 4 
  else 
    m = 3 
  end
  edate = Date.new(y,m,d) # Easter Date
end #when_is_easter

def epiphany_usa(year) #epiphany, in USA, is first Sunday after Jan 1
  temp = Date.new(year, 01, 02)
  while !(temp.wday == 0) do temp += 1 end
    temp
end #epiphany
  
def epiphany(year) #epiphany 
  temp = Date.new(year, 01, 06)
  temp
end #epiphany

def baptism_of_the_lord(year) #baptism of the lord is 1st Sun after Jan 6 unless Epiphany, then next day
  temp = Date.new(year, 01, 02)
  while !(temp.wday ==0) do temp += 1 end #epiphany
  case temp.day
    when 2..6
      temp += 1
      while !(temp.wday ==0) do temp += 1 end
  when 7
    temp += 1 
  when 8
    temp += 1 
  else
    while !(temp.wday ==0) do temp += 1 end
  end

  temp
end #baptism_of_the_lord

def ash_wednesday(year) #ash wednesday is 46d before Easter
  temp = easter year
  temp = temp - 46
end 

def ascension(year) #ascension is 39d after Easter
  temp = easter year
  temp = temp + 39
end

def ascension_sunday(year) #ascension is observed on Sunday in most of USA 42d after Easter
  temp = easter year
  temp = temp + 42
end

def pentecost(year) #pentecost is 49d after Easter
  temp = easter year
  temp = temp + 49
end

def holy_trinity(year) #Holy Trinity is first sunday after Pentecost (Easter + 56d)
  temp = easter year
  temp = temp + 56
end

def corpus_christi(year) #corpus_christi is 63d after Easter (it is also the Thursday after Holy Trinity)
  temp = easter year
  temp = temp + 63
end 

def sacred_heart(year) # Sacred Heart is Friday following Second Sunday after Pentecost (Easter + 49d + 14d + 5d)
  temp = easter year
  temp = temp + 68
end

def immaculate_heart(year)# Immaculate Heart of Mary is the Saturday following the second sunday after Pentecost (Easter + 49d + 14d + 6d)
  temp = easter year
  temp = temp + 69
end

def first_sunday_of_advent(year) # first sunday of advent is four sundays before December 25
  temp = Date.new(year, 12, 25)
  while !(temp.wday == 0) do temp -= 1 end #4th Sunday of Advent
  temp -= 21
end


today = Date.today
start_year = today.year - @years_into_past
final_year = today.year + @years_into_future
puts "Importing Principal Celebrations for #{@years_into_past} past years and #{@years_into_future} future (#{start_year} to #{final_year})"

start_year.upto final_year do |y|
  principal = Principal.find_or_create_by_year(y)
  principal.easter = easter(y)
  principal.epiphany = epiphany_usa(y)
  
  baptism_of_the_lord = baptism_of_the_lord(y)
  principal.baptism_of_the_lord = baptism_of_the_lord
  
  ash_wednesday = ash_wednesday(y)
  principal.ash_wednesday = ash_wednesday
  
  principal.ascension = ascension(y)
  principal.ascension_sunday = ascension_sunday(y)
  principal.pentecost = pentecost(y)
  principal.holy_trinity = holy_trinity(y)
  principal.corpus_christi = corpus_christi(y)
  principal.sacred_heart = sacred_heart(y)
  principal.immaculate_heart = immaculate_heart(y)
  principal.first_sunday_of_advent = first_sunday_of_advent(y)

  principal.start_of_ordinary_time_before_lent = principal.baptism_of_the_lord + 1
  principal.start_of_ordinary_time_after_easter = principal.pentecost + 1
  
  principal.weeks_in_ordinary_time_before_lent = (((ash_wednesday+3)-(baptism_of_the_lord)) ).to_i.div(7) + 1
  
  dominical = %w[ G F E D C B A]
  wday = Date.new(y,1,1).wday 
  leap = Date.new(y,1,1).leap?
  
  case wday
  when 0
    if !leap
      dominical_year = "A"
    else
      dominical_year = "AG"
    end
  when 1
    if !leap
      dominical_year = "G"
    else
      dominical_year = "GA"
    end
  when 2
    if !leap
      dominical_year = "F"
    else
      dominical_year = "FE"
    end
  when 3
    if !leap
      dominical_year = "E"
    else
      dominical_year = "ED"
    end
  when 4
    if !leap
      dominical_year = "D"
    else
      dominical_year = "DC"
    end
  when 5
    if !leap
      dominical_year = "C"
    else
      dominical_year = "CB"
    end
  when 6
    if !leap
      dominical_year = "B"
    else
      dominical_year = "BA"
    end
  end
  
  principal.dominical_year = dominical_year
  
  if dominical_year =~ /.*[B].*/
    principal.starting_week_of_ordinary_time_after_easter =  36 - (((principal.first_sunday_of_advent) - principal.pentecost).to_i).div(7)
  else
    principal.starting_week_of_ordinary_time_after_easter =  35 - (((principal.first_sunday_of_advent) - principal.pentecost).to_i).div(7)
  end
  
  principal.save
end
