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

ActiveRecord::Schema.define(version: 20180923112453) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "schedule_id"
    t.bigint "user_id"
    t.integer "interviewee_id"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedule_id"], name: "index_appointments_on_schedule_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "eachschedules", force: :cascade do |t|
    t.integer "start"
    t.integer "fin"
    t.string "weekday"
    t.bigint "user_id"
    t.bigint "schedule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedule_id"], name: "index_eachschedules_on_schedule_id"
    t.index ["user_id"], name: "index_eachschedules_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "getu_start"
    t.integer "getu_end"
    t.integer "ka_start"
    t.integer "ka_end"
    t.integer "sui_start"
    t.integer "sui_end"
    t.integer "moku_start"
    t.integer "moku_end"
    t.integer "kin_start"
    t.integer "kin_end"
    t.integer "doyou_start"
    t.integer "doyou_end"
    t.integer "niti_start"
    t.integer "niti_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image"
    t.text "introduction"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
