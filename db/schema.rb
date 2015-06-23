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

ActiveRecord::Schema.define(version: 20150622230534) do

  create_table "activities", force: :cascade do |t|
    t.integer  "admin_id"
    t.string   "pic"
    t.string   "title"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.boolean  "ticket_type"
    t.string   "ticket_auth_code"
  end

  create_table "exhibits", force: :cascade do |t|
    t.integer  "activity_id"
    t.string   "name"
    t.string   "pic"
    t.string   "src"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "beacon"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "activity_id"
    t.string   "ticket_code"
    t.string   "ticket_authentication_code"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
