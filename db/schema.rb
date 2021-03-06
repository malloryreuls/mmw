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

ActiveRecord::Schema.define(version: 20140608214519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "search_counts", force: true do |t|
    t.string   "query"
    t.integer  "count"
    t.datetime "most_recent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "search_terms", force: true do |t|
    t.integer  "search_id"
    t.integer  "term_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "search_terms", ["search_id"], name: "index_search_terms_on_search_id", using: :btree
  add_index "search_terms", ["term_id"], name: "index_search_terms_on_term_id", using: :btree

  create_table "searches", force: true do |t|
    t.string   "query"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "terms", force: true do |t|
    t.string   "name"
    t.integer  "search_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "terms", ["search_id"], name: "index_terms_on_search_id", using: :btree

end
