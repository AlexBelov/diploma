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

ActiveRecord::Schema.define(version: 20160514143743) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.string   "city"
    t.string   "country"
    t.decimal  "lat",               precision: 10, scale: 6
    t.decimal  "lng",               precision: 10, scale: 6
    t.boolean  "geocoded",                                   default: false, null: false
    t.json     "geocoder_response"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "linkedin_company_url"
    t.string   "website"
    t.string   "company_size"
    t.string   "company_type"
    t.string   "industry"
    t.date     "founded"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies_linkedin_data", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "linkedin_data_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facebook_data", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "original_name"
    t.string   "encoded_name"
    t.string   "facebook_id"
    t.boolean  "address_geocoded", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "github_data", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "login"
    t.string   "name"
    t.string   "email"
    t.integer  "num_repos"
    t.integer  "num_gists"
    t.integer  "num_followers"
    t.integer  "num_following"
    t.string   "blog"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: :cascade do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id", using: :btree

  create_table "imported_data", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "encoded_name"
    t.date     "graduated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
  end

  create_table "languages_repositories", force: :cascade do |t|
    t.integer  "language_id"
    t.integer  "repository_id"
    t.integer  "loc",           limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "linkedin_data", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "profile_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "encoded_name"
    t.string   "title"
    t.integer  "connections"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "linkedin_data_skills", force: :cascade do |t|
    t.integer  "linkedin_data_id"
    t.integer  "skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", force: :cascade do |t|
    t.integer  "linkedin_data_id"
    t.integer  "company_id"
    t.string   "title"
    t.string   "duration"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "current",          default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repositories", force: :cascade do |t|
    t.integer  "github_data_id"
    t.integer  "primary_language_id"
    t.string   "full_name"
    t.integer  "forks"
    t.integer  "issues"
    t.integer  "watchers"
    t.integer  "subscribers"
    t.integer  "stargazers"
    t.boolean  "fork",                default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.boolean  "facebook",         default: false, null: false
    t.boolean  "linkedin",         default: false, null: false
    t.boolean  "linkedin_scraped", default: false, null: false
    t.boolean  "github",           default: false, null: false
    t.boolean  "import",           default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
