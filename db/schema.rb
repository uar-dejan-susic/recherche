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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161117224556) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "options", force: :cascade do |t|
    t.string   "title"
    t.string   "template"
    t.integer  "available_slots"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prospects", force: :cascade do |t|
    t.integer  "option_id"
    t.integer  "person_id"
    t.boolean  "tried_to_opt_in", default: false
    t.boolean  "checked_in",      default: false
    t.datetime "checked_in_date"
    t.boolean  "opted_in",        default: false
    t.datetime "opted_in_date"
    t.string   "access_token"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["option_id"], name: "index_prospects_on_option_id", using: :btree
    t.index ["person_id"], name: "index_prospects_on_person_id", using: :btree
  end

end
