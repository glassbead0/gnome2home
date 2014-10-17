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

ActiveRecord::Schema.define(version: 20141017192336) do

  create_table "admins", force: true do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "passengers", force: true do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
  end

  add_index "passengers", ["email"], name: "index_passengers_on_email", unique: true
  add_index "passengers", ["reset_password_token"], name: "index_passengers_on_reset_password_token", unique: true

  create_table "stops", force: true do |t|
    t.string   "location"
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "van_id"
    t.string   "human_readable"
  end

  create_table "tickets", force: true do |t|
    t.boolean  "scanned",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "van_id"
    t.integer  "passenger_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "qrcode"
  end

  create_table "vans", force: true do |t|
    t.string   "driver"
    t.string   "direction"
    t.datetime "departure_time"
    t.integer  "seats_available",         default: 14
    t.integer  "seats_occupied",          default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "admin_id"
    t.boolean  "active",                  default: false
    t.string   "departure_time_readable"
  end

end
