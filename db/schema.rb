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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140614141247) do

  create_table "admins", force: true do |t|
    t.integer  "drive_id"
    t.integer  "user_id"
    t.boolean  "is_super",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "donors", force: true do |t|
    t.integer "user_id"
    t.integer "drive_id"
    t.integer "drop_location_id"
    t.integer "family_id"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "company"
    t.string  "street"
    t.string  "city"
    t.string  "state"
    t.string  "zipcode"
    t.string  "phone"
    t.integer "drop_date_id"
  end

  create_table "drives", force: true do |t|
    t.string   "year"
    t.text     "blurb"
    t.date     "start_date",            limit: 255
    t.date     "end_date",              limit: 255
    t.string   "fundraising_url"
    t.text     "fundraising_blurb"
    t.string   "donation_receipt_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "status",                            default: false
  end

  create_table "drop_dates", force: true do |t|
    t.datetime "date_and_time"
    t.integer  "drop_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drop_locations", force: true do |t|
    t.integer  "drive_id"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "families", force: true do |t|
    t.integer  "drive_id"
    t.integer  "adopted_by"
    t.string   "received_at_org",  default: "f"
    t.string   "given_to_family",  default: "f"
    t.string   "code"
    t.integer  "drop_location_id"
    t.integer  "donor_id"
    t.integer  "num_boxes"
    t.integer  "drop_date_id"
    t.boolean  "is_live",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "family_members", force: true do |t|
    t.integer "family_id"
    t.string  "first_name"
    t.string  "gender"
    t.string  "size_pants"
    t.string  "size_shirt"
    t.string  "size_dress"
    t.string  "size_shoes"
    t.text    "bio"
    t.string  "age"
  end

  create_table "needs", force: true do |t|
    t.text    "item"
    t.integer "family_member_id"
  end

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.text     "blurb"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.string   "zip"
    t.string   "website_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "super_admins", force: true do |t|
    t.integer  "drive_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "full_name"
    t.string   "company"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.integer  "drop_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
