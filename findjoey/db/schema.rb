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

ActiveRecord::Schema.define(version: 3) do

  create_table "pet", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.integer "weight"
    t.string "pet_temperament"
    t.boolean "pet_chipped"
    t.string "pet_chip_id"
    t.boolean "pet_collared"
    t.string "pet_color"
    t.datetime "pet_went_missing"
    t.datetime "date_found"
    t.string "pet_images"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "user_fname"
    t.string "user_lname"
    t.string "addr_1"
    t.string "addr_2"
    t.string "city"
    t.string "state"
    t.string "user_zipcode"
    t.string "user_email"
    t.string "user_phone_1"
    t.string "user_phone_2"
    t.boolean "is_missing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zipcodes", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "zipcode"
    t.float "latitude", limit: 53
    t.float "longitude", limit: 53
    t.text "city"
    t.text "state"
    t.text "county"
    t.index ["zipcode"], name: "idx_zipcodes_zipcode", unique: true
  end

end
