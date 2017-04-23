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

ActiveRecord::Schema.define(version: 20170423201021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "added_foods", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "food_id"
    t.integer  "meal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "status"
  end

  create_table "foods", force: :cascade do |t|
    t.string   "name"
    t.decimal  "calories",     precision: 10, scale: 2
    t.decimal  "protein",      precision: 10, scale: 2
    t.decimal  "totalfat",     precision: 10, scale: 2
    t.decimal  "sugar",        precision: 10, scale: 2
    t.decimal  "sodium",       precision: 10, scale: 2
    t.decimal  "cholesterol",  precision: 10, scale: 2
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "serving_size"
    t.string   "unit"
  end

  create_table "meals", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "total_calories"
    t.integer  "total_protein"
    t.integer  "total_totalfat"
    t.integer  "total_sugar"
    t.integer  "total_sodium"
    t.integer  "total_cholesterol"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "height"
    t.integer  "weight"
    t.integer  "age"
    t.integer  "geneder"
    t.integer  "activity_level"
    t.integer  "BMI"
    t.integer  "avg_calories"
    t.integer  "avg_protein"
    t.integer  "avg_totalfat"
    t.integer  "avg_sugar"
    t.integer  "avg_sodium"
    t.integer  "avg_choleserol"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
