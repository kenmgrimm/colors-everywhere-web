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

ActiveRecord::Schema.define(version: 20160807000726) do

  create_table "paintings", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "direction_degrees"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "points", force: :cascade do |t|
    t.integer  "stroke_id"
    t.float    "position_x"
    t.float    "position_y"
    t.float    "position_z"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "strokes", force: :cascade do |t|
    t.integer  "painting_id"
    t.integer  "brush_type"
    t.string   "color"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
