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

ActiveRecord::Schema.define(:version => 20130505140800) do

  create_table "gcm_devices", :force => true do |t|
    t.string   "registration_id",    :null => false
    t.datetime "last_registered_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "gcm_devices", ["registration_id"], :name => "index_gcm_devices_on_registration_id", :unique => true

  create_table "gcm_notifications", :force => true do |t|
    t.integer  "device_id",        :null => false
    t.string   "collapse_key"
    t.text     "data"
    t.boolean  "delay_while_idle"
    t.datetime "sent_at"
    t.integer  "time_to_live"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "gcm_notifications", ["device_id"], :name => "index_gcm_notifications_on_device_id"

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

  create_table "matches", :force => true do |t|
    t.date     "date"
    t.time     "time"
    t.string   "player1"
    t.string   "player2"
    t.string   "parentTournament"
    t.string   "links"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "status"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "subscriptions", :force => true do |t|
    t.integer  "tournament_entry_id"
    t.string   "device_registration_id"
    t.integer  "match_entry_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "subscriptions", ["device_registration_id"], :name => "index_subscriptions_on_device_id"
  add_index "subscriptions", ["match_entry_id"], :name => "index_subscriptions_on_match_entry_id"
  add_index "subscriptions", ["tournament_entry_id"], :name => "index_subscriptions_on_tournament_entry_id"

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

  create_table "tournament_requests", :force => true do |t|
    t.integer  "tourny_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tournaments", :force => true do |t|
    t.string   "start_date"
    t.string   "name"
    t.string   "sponsor"
    t.string   "location"
    t.string   "prizes"
    t.string   "entry_reqs"
    t.string   "format"
    t.string   "links"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "subscribed"
    t.boolean  "ongoing"
    t.boolean  "past"
    t.boolean  "future"
  end

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
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
