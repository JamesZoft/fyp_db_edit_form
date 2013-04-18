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

ActiveRecord::Schema.define(:version => 20130417173735) do

  create_table "match_entries", :force => true do |t|
    t.date     "date"
    t.string   "links"
    t.string   "parentTournament"
    t.string   "player1"
    t.string   "player2"
    t.string   "status"
    t.time     "time"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "tournament_entries", :force => true do |t|
    t.string   "entry_reqs"
    t.string   "format"
    t.boolean  "future"
    t.boolean  "past"
    t.boolean  "ongoing"
    t.string   "links"
    t.string   "location"
    t.string   "name"
    t.string   "prizes"
    t.string   "sponsor"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
