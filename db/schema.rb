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

ActiveRecord::Schema.define(version: 20131120194243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "followers", force: true do |t|
    t.integer  "i_follow_id"
    t.integer  "follows_me_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved",      default: false
  end

  create_table "scraps", force: true do |t|
    t.text   "body"
    t.string   "search_tag"
    t.integer  "vote_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "scrap_name"
  end

  add_index "scraps", ["user_id"], name: "index_scraps_on_user_id", using: :btree

  create_table "user_attrs", force: true do |t|
    t.string   "password"
    t.string   "hashed_password"
    t.string   "email"
    t.string   "salt"
    t.integer  "user_name_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_attrs", ["user_name_id"], name: "index_user_attrs_on_user_name_id", using: :btree

  create_table "user_names", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "salt"
    t.string   "hashed_password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: true do |t|
    t.integer  "vote_number"
    t.integer  "user_id"
    t.integer  "scrap_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["scrap_id"], name: "index_votes_on_scrap_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

end
