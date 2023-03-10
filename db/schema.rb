# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_10_135412) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "connections", force: :cascade do |t|
    t.string "connection_type"
    t.boolean "pending"
    t.boolean "accepted"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.index ["receiver_id"], name: "index_connections_on_receiver_id"
    t.index ["sender_id"], name: "index_connections_on_sender_id"
  end

  create_table "investors", force: :cascade do |t|
    t.boolean "private"
    t.string "funding_type"
    t.string "investor_type"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_investors_on_user_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.datetime "meeting_time"
    t.integer "duration"
    t.boolean "meeting_accepted"
    t.boolean "meeting_pending"
    t.bigint "connection_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["connection_id"], name: "index_meetings_on_connection_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "bio"
    t.string "position"
    t.bigint "startup_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["startup_id"], name: "index_members_on_startup_id"
  end

  create_table "startups", force: :cascade do |t|
    t.string "funding"
    t.integer "team"
    t.date "funding_round_end_date"
    t.float "funding_amount"
    t.string "industry"
    t.integer "headcount"
    t.integer "turnover"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "bio"
    t.index ["user_id"], name: "index_startups_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company_name"
    t.string "first_name"
    t.string "last_name"
    t.string "user_type"
    t.string "address"
    t.string "city"
    t.string "country"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "connections", "users", column: "receiver_id"
  add_foreign_key "connections", "users", column: "sender_id"
  add_foreign_key "investors", "users"
  add_foreign_key "meetings", "connections"
  add_foreign_key "members", "startups"
  add_foreign_key "startups", "users"
end
