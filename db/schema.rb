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

ActiveRecord::Schema.define(:version => 20121201192840) do

  create_table "calendars", :force => true do |t|
    t.date     "data",        :null => false
    t.integer  "season_id"
    t.integer  "week"
    t.string   "day_of_week"
    t.integer  "rank_id",     :null => false
    t.integer  "color_id"
    t.string   "title"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
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

  create_table "ordos", :force => true do |t|
    t.string   "code",       :null => false
    t.string   "title",      :null => false
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "ordos", ["code"], :name => "index_ordos_on_code", :unique => true

  create_table "ranks", :force => true do |t|
    t.string   "code"
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "seasons", :force => true do |t|
    t.string   "code",       :null => false
    t.string   "title",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "seasons", ["code"], :name => "index_seasons_on_code", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
    t.boolean  "boolean",         :default => false
    t.boolean  "editor",          :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
