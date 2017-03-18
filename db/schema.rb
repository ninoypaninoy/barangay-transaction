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

ActiveRecord::Schema.define(version: 20170315062241) do

  create_table "officials", force: :cascade do |t|
    t.string   "official_first_name"
    t.string   "official_middle_name"
    t.string   "official_last_name"
    t.string   "official_position"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string   "request"
    t.string   "business_name"
    t.string   "business_type"
    t.string   "business_address"
    t.string   "line_of_business"
    t.integer  "business_contact"
    t.string   "business_month_started"
    t.integer  "business_day_started"
    t.integer  "business_years_operation"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "nickname"
    t.string   "residence_type"
    t.integer  "transient_since"
    t.string   "bhouse_owner"
    t.string   "address"
    t.integer  "contact_no"
    t.string   "gender"
    t.string   "status"
    t.string   "birth_month"
    t.integer  "birth_day"
    t.integer  "birth_year"
    t.string   "birth_place"
    t.decimal  "gross_income"
    t.decimal  "height"
    t.decimal  "weight"
    t.string   "blood_type"
    t.string   "occupation"
    t.decimal  "monthly_income"
    t.string   "purpose"
    t.string   "emergency_contact_person"
    t.string   "relationship"
    t.integer  "contact_no_2"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "position"
    t.string   "reminder"
    t.date     "birthday"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
