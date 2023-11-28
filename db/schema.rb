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

ActiveRecord::Schema[7.1].define(version: 2023_11_28_013515) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audiences", force: :cascade do |t|
    t.integer "minimum_age"
    t.integer "maximum_age"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gender"], name: "index_audiences_on_gender"
    t.index ["maximum_age"], name: "index_audiences_on_maximum_age"
    t.index ["minimum_age"], name: "index_audiences_on_minimum_age"
    t.check_constraint "gender::text = ANY (ARRAY['Male'::character varying, 'Female'::character varying, 'All'::character varying]::text[])"
    t.check_constraint "minimum_age IS NULL OR maximum_age IS NULL OR minimum_age <= maximum_age"
  end

  create_table "offers", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "audience_id", null: false
    t.index ["audience_id"], name: "index_offers_on_audience_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "birthdate"
    t.string "gender"
    t.index ["birthdate"], name: "index_users_on_birthdate"
    t.index ["email"], name: "index_users_on_email"
    t.index ["gender"], name: "index_users_on_gender"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "offers", "audiences"
end
