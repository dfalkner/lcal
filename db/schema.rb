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

ActiveRecord::Schema.define(:version => 20121130201126) do

  create_table "calendars", :force => true do |t|
    t.date     "cal_date",   :null => false
    t.integer  "season_id",  :null => false
    t.integer  "week"
    t.string   "day"
    t.integer  "rank_id"
    t.integer  "color_id"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "calendars", ["cal_date"], :name => "index_calendars_on_cal_date", :unique => true

  create_table "colors", :force => true do |t|
    t.string   "title",      :null => false
    t.string   "code",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "colors", ["code"], :name => "index_colors_on_code", :unique => true

  create_table "commons", :force => true do |t|
    t.string   "title",      :null => false
    t.string   "code",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "commons", ["code"], :name => "index_commons_on_code", :unique => true

  create_table "commons_roman_calendars", :id => false, :force => true do |t|
    t.integer "common_id"
    t.integer "roman_calendar_id"
  end

  create_table "ordos", :force => true do |t|
    t.string   "title",      :null => false
    t.string   "code",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "ordos", ["code"], :name => "index_ordos_on_code", :unique => true

  create_table "ranks", :force => true do |t|
    t.string   "title",      :null => false
    t.string   "code",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "ranks", ["code"], :name => "index_ranks_on_code", :unique => true

  create_table "roman_calendars", :force => true do |t|
    t.integer  "ordo_id",    :null => false
    t.string   "feast_day"
    t.integer  "rank_id",    :null => false
    t.integer  "color_id"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "seasons", :force => true do |t|
    t.string   "title",      :null => false
    t.string   "code",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "seasons", ["code"], :name => "index_seasons_on_code", :unique => true

end
