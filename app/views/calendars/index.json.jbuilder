json.array!(@calendars) do |cal|
	json.id cal.id
	json.date cal.data
	json.ordo cal.ordo.title
	json.rank cal.rank.title
	json.position cal.rank.position
	json.season cal.season.title
	json.week_in_season cal.week_in_season
	json.title cal.title
	json.color cal.color.title
	json.updated_at cal.updated_at
end