class CreatePrincipals < ActiveRecord::Migration
  def change
    create_table :principals do |t|
      t.integer :year
      t.string :dominical_year
      t.date :epiphany
      t.date :baptism_of_the_lord
      t.date :ash_wednesday
      t.date :easter
      t.date :ascension
      t.date :ascension_sunday
      t.date :pentecost
      t.date :holy_trinity
      t.date :corpus_christi
      t.date :sacred_heart
      t.date :immaculate_heart
      t.date :first_sunday_of_advent
      t.date :start_of_ordinary_time_before_lent
      t.integer :weeks_in_ordinary_time_before_lent
      t.date :start_of_ordinary_time_after_easter
      t.integer :starting_week_of_ordinary_time_after_easter

      t.timestamps
    end
  end
end
