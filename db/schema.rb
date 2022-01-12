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

ActiveRecord::Schema.define(version: 2021_12_20_121737) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name_customer"
    t.string "phone_customer"
    t.date "brithday_customer"
    t.boolean "deactivated_customer", default: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "role"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.text "image"
    t.string "verification_code"
    t.boolean "is_verified"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "loyalty_point_transactions", force: :cascade do |t|
    t.integer "point_customer_transaction"
    t.string "trans_type", default: "get-point"
    t.bigint "loyalty_point_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reward_transaction"
    t.datetime "reward_expired"
    t.index ["loyalty_point_id"], name: "index_loyalty_point_transactions_on_loyalty_point_id"
  end

  create_table "loyalty_points", force: :cascade do |t|
    t.integer "point_customer"
    t.bigint "customer_id"
    t.bigint "t_mitra_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_loyalty_points_on_customer_id"
    t.index ["t_mitra_id"], name: "index_loyalty_points_on_t_mitra_id"
  end

  create_table "loyalty_programs", force: :cascade do |t|
    t.integer "point_loyalty"
    t.datetime "start_loyalty"
    t.datetime "end_loyalty"
    t.string "status_loyalty"
    t.text "keterangan_loyalty"
    t.bigint "reward_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "t_mitra_id"
    t.index ["reward_id"], name: "index_loyalty_programs_on_reward_id"
    t.index ["t_mitra_id"], name: "index_loyalty_programs_on_t_mitra_id"
  end

  create_table "rewards", force: :cascade do |t|
    t.string "reward_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "t_mitras", force: :cascade do |t|
    t.string "nama_mitra"
    t.string "alamat"
    t.string "telp"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_t_mitras_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "role"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "deactivated", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "loyalty_point_transactions", "loyalty_points"
  add_foreign_key "loyalty_points", "customers"
  add_foreign_key "loyalty_points", "t_mitras"
  add_foreign_key "loyalty_programs", "rewards"
  add_foreign_key "loyalty_programs", "t_mitras"
  add_foreign_key "t_mitras", "users"
end
