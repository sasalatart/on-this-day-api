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

ActiveRecord::Schema.define(version: 20170506224902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "day_months", force: :cascade do |t|
    t.integer "day"
    t.integer "month"
    t.text    "description"
    t.index ["day", "month"], name: "index_day_months_on_day_and_month", using: :btree
  end

  create_table "episodes", force: :cascade do |t|
    t.integer "year"
    t.boolean "bce",          default: false
    t.integer "episode_type", default: 0,     null: false
    t.text    "text"
    t.integer "day_month_id"
    t.index ["day_month_id"], name: "index_episodes_on_day_month_id", using: :btree
  end

  create_table "keywords", force: :cascade do |t|
    t.integer "episode_id"
    t.string  "title"
    t.string  "href"
    t.index ["episode_id"], name: "index_keywords_on_episode_id", using: :btree
  end

end
