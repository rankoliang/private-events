# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_10_071544) do

  create_table "attended_events", id: false, force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "attendee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "accepted", default: false
    t.index ["accepted"], name: "index_attended_events_on_accepted"
    t.index ["attendee_id"], name: "index_attended_events_on_attendee_id"
    t.index ["event_id", "attendee_id"], name: "by_attendee_and_event", unique: true
    t.index ["event_id"], name: "index_attended_events_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "date"
    t.string "location"
    t.string "title"
    t.text "description"
    t.integer "creator_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_events_on_creator_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "attended_events", "events"
  add_foreign_key "attended_events", "users", column: "attendee_id"
  add_foreign_key "events", "users", column: "creator_id"
end
