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

ActiveRecord::Schema.define(version: 20180330215637) do

  create_table "players", force: :cascade do |t|
    t.string "name_brief"
    t.string "first_name"
    t.string "last_name"
    t.integer "position_id"
    t.integer "sport_id"
    t.integer "age"
    t.float "average_position_age_diff"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["position_id"], name: "index_players_on_position_id"
    t.index ["sport_id"], name: "index_players_on_sport_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "title"
    t.float "avg_age"
    t.integer "sport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_positions_on_sport_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
