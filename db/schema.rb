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

ActiveRecord::Schema.define(version: 20170313101126) do

  create_table "spots", force: :cascade do |t|
    t.string   "name"
    t.string   "en_name"
    t.string   "status"
    t.string   "category"
    t.string   "place"
    t.string   "postalcode"
    t.string   "prefecture"
    t.string   "address"
    t.string   "en_address"
    t.string   "phone"
    t.string   "time"
    t.string   "ssid"
    t.string   "limit"
    t.string   "procedure"
    t.string   "language"
    t.string   "url"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "placecode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_spots_on_address"
    t.index ["en_address"], name: "index_spots_on_en_address"
    t.index ["en_name"], name: "index_spots_on_en_name"
    t.index ["latitude"], name: "index_spots_on_latitude"
    t.index ["longitude"], name: "index_spots_on_longitude"
    t.index ["name"], name: "index_spots_on_name"
  end

end
