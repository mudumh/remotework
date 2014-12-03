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

ActiveRecord::Schema.define(version: 20141203214917) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "headquarters"
    t.string   "email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "image"
  end

  create_table "job_postings", force: true do |t|
    t.string   "job_title"
    t.date     "posted_on"
    t.text     "job_desc"
    t.string   "category"
    t.text     "application_instructions"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "company_id"
    t.boolean  "activated",                default: false
  end

  add_index "job_postings", ["company_id"], name: "index_job_postings_on_company_id", using: :btree

  create_table "subscribers", force: true do |t|
    t.string   "email"
    t.boolean  "activated"
    t.string   "activation_digest"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "temp_job_posts", force: true do |t|
    t.string   "job_title"
    t.date     "posted_on"
    t.text     "job_desc"
    t.string   "category"
    t.text     "application_instructions"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "company_id"
  end

  add_index "temp_job_posts", ["company_id"], name: "index_temp_job_posts_on_company_id", using: :btree

end
