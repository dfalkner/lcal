class Principal < ActiveRecord::Base
  attr_accessible :ascension, :ascension_sunday, :ash_wednesday, :baptism_of_the_lord, :corpus_christi, :dominical_year, :easter, :epiphany, :first_sunday_of_advent, :holy_trinity, :immaculate_heart, :pentecost, :sacred_heart, :start_of_ordinary_time_after_easter, :start_of_ordinary_time_before_lent, :starting_week_of_ordinary_time_after_easter, :weeks_in_ordinary_time_before_lent, :year

  resourcify

end
