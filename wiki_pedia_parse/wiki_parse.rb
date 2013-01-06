require 'strscan'
days_in_week = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
months_in_year = %w[January February March April May June July August September October November December]

in_fn = "national_calendars_from_wikipedia.txt"
out_fn = "national_calendars.tsv"
out_file = File.open(out_fn, 'w')
puts "\n\n\n\nBe sure to edit the file #{in_fn} and remove the text [edit] and the lines following each nation indicating source. Also search and replace all invalid multibye characters.\n\n"
in_lines = IO.readlines(in_fn)
@out_lines = []
@ordo_code

in_lines.each do |i|
  i.chomp!
  next if i =~ /^According.*/ #skip the line that starts "According to ..."
  # add code to remove [edit]
  i = i.sub('[edit]','') if i =~ /^[edit].*/  #remove [edit] text
    
  case i
  when "Argentina"
    @ordo_code = 'ar'
  when "Australia"
    @ordo_code = 'au'
  when "Brazil"
    @ordo_code = 'br'
  when "Canada"
    @ordo_code = 'ca'
  when "Chile"
    @ordo_code = 'cl'
  when "Croatia"
    @ordo_code = 'hr'
  when "England"
    @ordo_code = 'eng'
  when "Greece"
    @ordo_code = 'gr'
  when "Ireland"
    @ordo_code = 'ie'
  when "Lebanon"
    @ordo_code = 'lb'
  when "Malta"
    @ordo_code = 'mt'
  when "New Zealand"
    @ordo_code = 'nz'
  when "Philippines"
    @ordo_code = 'ph'
  when "Portugal"
    @ordo_code = 'pt'
  when "Puerto Rico"
    @ordo_code = 'pr'
  when "Scotland"
    @ordo_code = 'scot'
  when "Slovakia"
    @ordo_code = 'sk'
  when "Spain"
    @ordo_code = 'es'
  when "Sri Lanka"
    @ordo_code = 'lk'
  when "United States"
    @ordo_code = 'usa'
  when "Anglican use"
    @ordo_code = 'usaa'
  when "Vietnam"
    @ordo_code = 'vn'
  when "Wales"
    @ordo_code = 'wal'
    
  end
  
  if i =~ /.*:.*/
    temp_str = i.partition(':')
    temp_array = temp_str[0].partition(' ')
    temp_day = temp_array[0]
    temp_month = months_in_year.find_index(temp_array[2]).to_i + 1
    date_str = "%02d%02d" % [temp_month.to_i, temp_day.to_i]
    
    desc_and_rank = temp_str[2].partition(' - ')
    description = desc_and_rank[0].strip
    rank = desc_and_rank[2].strip
    
    case rank
    when /.*[Ss]olemnity.*/
      rank_code = 'sol'
    when /.*[Ff]east.*/
      rank_code = 'fst'
    when /^[Mm]emorial.*/
      rank_code = 'mem'
    when /^[Oo]bligatory.*/
      rank_code = 'obl'
    when /^Opt.*/
      rank_code = 'opt'
    else
      rank_code = '-'   
    end
  end

  
  if !date_str.nil?
    #@out_lines << ["#{@ordo_code}\t#{date_str}\t#{rank_code}\t \t#{description}"]
    out_file.write("#{@ordo_code}\t#{date_str}\t#{rank_code}\t \t#{description}\n")
    
    #ofile.write("#{f.data.strftime("%Y%m%d")},#{season},w#{f.week_in_season},#{f.day_of_week},#{color},#{Rank.find(f.rank_id).title},\"#{f.title.chomp}\"\n")
  end
  
end

