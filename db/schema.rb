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

ActiveRecord::Schema.define(version: 20170711144223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "provider_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_conversations_on_provider_id"
    t.index ["user_id"], name: "index_conversations_on_user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "provider_id"
    t.bigint "joblisting_id"
    t.string "invoice_ref", null: false
    t.decimal "price", precision: 10, null: false
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["joblisting_id"], name: "index_invoices_on_joblisting_id"
    t.index ["provider_id"], name: "index_invoices_on_provider_id"
  end

  create_table "job_attaches", force: :cascade do |t|
    t.string "image", null: false
    t.string "title", null: false
    t.bigint "joblisting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["joblisting_id"], name: "index_job_attaches_on_joblisting_id"
  end

  create_table "joblistings", force: :cascade do |t|
    t.string "issue", null: false
    t.text "description", null: false
    t.string "fixture", null: false
    t.integer "num_fixture", null: false
    t.string "housing", null: false
    t.text "job_address", null: false
    t.bigint "user_id"
    t.bigint "provider_id"
    t.integer "status", default: 1, null: false
    t.string "date", null: false
    t.string "time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_joblistings_on_provider_id"
    t.index ["user_id"], name: "index_joblistings_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_likes_on_provider_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "provider_attaches", force: :cascade do |t|
    t.string "image", null: false
    t.string "title", null: false
    t.bigint "provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_provider_attaches_on_provider_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "firstname", null: false
    t.string "lastname", null: false
    t.string "tel_num", null: false
    t.string "license_num"
    t.text "description"
    t.integer "experience"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_providers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_providers_on_reset_password_token", unique: true
  end

  create_table "schedules", force: :cascade do |t|
    t.string "date", null: false
    t.string "time", null: false
    t.bigint "provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_schedules_on_provider_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstname", null: false
    t.string "lastname"
    t.string "tel_num"
    t.text "user_address"
    t.boolean "is_admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "conversations", "providers"
  add_foreign_key "conversations", "users"
  add_foreign_key "invoices", "joblistings"
  add_foreign_key "invoices", "providers"
  add_foreign_key "job_attaches", "joblistings"
  add_foreign_key "joblistings", "providers"
  add_foreign_key "joblistings", "users"
  add_foreign_key "likes", "providers"
  add_foreign_key "likes", "users"
  add_foreign_key "provider_attaches", "providers"
  add_foreign_key "schedules", "providers"
end
