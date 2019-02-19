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

ActiveRecord::Schema.define(version: 2019_02_18_201819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_venues", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_venues_on_event_id"
    t.index ["venue_id"], name: "index_event_venues_on_venue_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.string "contact"
    t.string "aasm_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tour_id"
    t.bigint "venue_id"
    t.index ["tour_id"], name: "index_events_on_tour_id"
    t.index ["venue_id"], name: "index_events_on_venue_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.string "lat"
    t.string "lng"
    t.string "country"
    t.string "iso2"
    t.string "region"
    t.string "capital"
    t.string "population"
    t.string "population_proper"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "body"
    t.bigint "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["venue_id"], name: "index_reviews_on_venue_id"
  end

  create_table "tours", force: :cascade do |t|
    t.string "title"
    t.string "band"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.json "geo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_venues_on_user_id"
  end

  add_foreign_key "event_venues", "events"
  add_foreign_key "event_venues", "venues"
  add_foreign_key "events", "tours"
  add_foreign_key "events", "venues"
  add_foreign_key "reviews", "venues"
end
