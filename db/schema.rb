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

ActiveRecord::Schema.define(version: 2019_09_12_103456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "connections", force: :cascade do |t|
    t.string "name"
    t.string "transport_type"
    t.string "provider"
    t.string "provider_website"
    t.boolean "booking_status"
    t.decimal "cost"
    t.string "origin_city"
    t.string "destination_city"
    t.bigint "journey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "start_time"
    t.string "end_time"
    t.float "start_latitude"
    t.float "start_longitude"
    t.float "end_latitude"
    t.float "end_longitude"
    t.index ["journey_id"], name: "index_connections_on_journey_id"
  end

  create_table "journey_tokens", force: :cascade do |t|
    t.string "start_city"
    t.string "end_city"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "starts_at"
  end

  create_table "journeys", force: :cascade do |t|
    t.string "name"
    t.string "start_city"
    t.string "end_city"
    t.string "booking_status"
    t.boolean "archived"
    t.bigint "user_id"
    t.integer "total_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "total_duration"
    t.string "total_distance"
    t.string "token"
    t.index ["token"], name: "index_journeys_on_token", unique: true
    t.index ["user_id"], name: "index_journeys_on_user_id"
  end

  create_table "poi_bookings", force: :cascade do |t|
    t.bigint "connection_id"
    t.bigint "poi_id"
    t.boolean "booking_status"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["connection_id"], name: "index_poi_bookings_on_connection_id"
    t.index ["poi_id"], name: "index_poi_bookings_on_poi_id"
  end

  create_table "pois", force: :cascade do |t|
    t.string "name"
    t.string "google_place_id"
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.integer "price_level"
    t.string "category"
    t.string "phone_number"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "username"
    t.json "storage"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "connections", "journeys"
  add_foreign_key "journeys", "users"
  add_foreign_key "poi_bookings", "connections"
  add_foreign_key "poi_bookings", "pois"
end
