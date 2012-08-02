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

ActiveRecord::Schema.define(:version => 20120802015153) do

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.integer  "named_price"
    t.integer  "city_id"
    t.text     "description"
    t.text     "private_description"
    t.integer  "cost_in_cents"
    t.boolean  "virtual"
    t.string   "assignment_type"
    t.integer  "number_runners_to_fill"
    t.datetime "complete_by_time"
    t.datetime "assign_by_time"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "remote_id"
    t.string   "remote_path"
    t.string   "state"
  end

  create_table "users", :force => true do |t|
    t.integer  "remote_id"
    t.string   "token"
    t.string   "display_name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
