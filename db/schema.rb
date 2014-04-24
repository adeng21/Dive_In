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

ActiveRecord::Schema.define(version: 20140422195122) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree

  create_table "divesite_categories", force: true do |t|
    t.integer  "divesite_id", null: false
    t.integer  "category_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "divesite_categories", ["divesite_id", "category_id"], name: "index_divesite_categories_on_divesite_id_and_category_id", unique: true, using: :btree

  create_table "divesite_months", force: true do |t|
    t.integer  "month_id",    null: false
    t.integer  "divesite_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "divesite_months", ["divesite_id", "month_id"], name: "index_divesite_months_on_divesite_id_and_month_id", unique: true, using: :btree

  create_table "divesites", force: true do |t|
    t.string   "name",              null: false
    t.string   "region"
    t.string   "country",           null: false
    t.text     "description",       null: false
    t.text     "surrounding_area"
    t.integer  "rating",            null: false
    t.string   "water_temperature"
    t.string   "visibility"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude",          null: false
    t.float    "longitude",         null: false
  end

  create_table "media", force: true do |t|
    t.string   "image"
    t.integer  "divesite_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  add_index "media", ["divesite_id"], name: "index_media_on_divesite_id", using: :btree

  create_table "months", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "months", ["name"], name: "index_months_on_name", unique: true, using: :btree

  create_table "reviews", force: true do |t|
    t.string   "title",       null: false
    t.text     "body",        null: false
    t.float    "rating",      null: false
    t.date     "date",        null: false
    t.integer  "divesite_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "reviews", ["divesite_id"], name: "index_reviews_on_divesite_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "first_name",                                null: false
    t.string   "last_name",                                 null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                   default: "member", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
