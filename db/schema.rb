# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121222031938) do

  create_table "calendars", :force => true do |t|
    t.integer  "ordo_id"
    t.date     "data"
    t.integer  "rank_id"
    t.integer  "season_id"
    t.integer  "color_id"
    t.integer  "week_in_season"
    t.integer  "day_of_week_id"
    t.string   "title"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "colors", :force => true do |t|
    t.string   "code",       :null => false
    t.string   "title",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "colors", ["code"], :name => "index_colors_on_code", :unique => true

  create_table "commons", :force => true do |t|
    t.string   "code",       :null => false
    t.string   "title",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "commons", ["code"], :name => "index_commons_on_code", :unique => true

  create_table "commons_feasts", :id => false, :force => true do |t|
    t.integer "common_id", :null => false
    t.integer "feast_id",  :null => false
  end

  add_index "commons_feasts", ["common_id"], :name => "index_commons_feasts_on_common_id"
  add_index "commons_feasts", ["feast_id"], :name => "index_commons_feasts_on_feast_id"

  create_table "day_of_weeks", :force => true do |t|
    t.string   "code"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "feasts", :force => true do |t|
    t.integer  "ordo_id"
    t.integer  "month"
    t.integer  "day"
    t.integer  "rank_id"
    t.integer  "color_id"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "feasts", ["ordo_id", "title"], :name => "index_feasts_on_ordo_id_and_title", :unique => true

  create_table "ordos", :force => true do |t|
    t.string   "code",       :null => false
    t.string   "title",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "ordos", ["code"], :name => "index_ordos_on_code", :unique => true

  create_table "principals", :force => true do |t|
    t.integer  "year"
    t.string   "dominical_year"
    t.date     "epiphany"
    t.date     "baptism_of_the_lord"
    t.date     "ash_wednesday"
    t.date     "easter"
    t.date     "ascension"
    t.date     "ascension_sunday"
    t.date     "pentecost"
    t.date     "holy_trinity"
    t.date     "corpus_christi"
    t.date     "sacred_heart"
    t.date     "immaculate_heart"
    t.date     "first_sunday_of_advent"
    t.date     "start_of_ordinary_time_before_lent"
    t.integer  "weeks_in_ordinary_time_before_lent"
    t.date     "start_of_ordinary_time_after_easter"
    t.integer  "starting_week_of_ordinary_time_after_easter"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  create_table "ranks", :force => true do |t|
    t.string   "code"
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "ranks", ["code"], :name => "index_ranks_on_code", :unique => true

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "seasons", :force => true do |t|
    t.string   "code",       :null => false
    t.string   "title",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "seasons", ["code"], :name => "index_seasons_on_code", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
