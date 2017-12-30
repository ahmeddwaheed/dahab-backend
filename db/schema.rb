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

ActiveRecord::Schema.define(version: 20171230155825) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pools", force: :cascade do |t|
    t.string "name"
    t.bigint "admin_id"
    t.integer "amount"
    t.integer "monthly_amount"
    t.integer "seat_number"
    t.string "status"
    t.integer "turn"
    t.time "launch_date"
    t.time "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_of_users"
    t.index ["admin_id"], name: "index_pools_on_admin_id"
  end

  create_table "requests", force: :cascade do |t|
    t.boolean "is_accepted", default: false
    t.bigint "user_id"
    t.bigint "pool_id"
    t.text "reason"
    t.text "background"
    t.string "program"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pool_id"], name: "index_requests_on_pool_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "user_pools", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "pool_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pool_id"], name: "index_user_pools_on_pool_id"
    t.index ["user_id"], name: "index_user_pools_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "email"
    t.boolean "in_pool", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirm_add"
    t.string "confirmation_token"
  end

end
