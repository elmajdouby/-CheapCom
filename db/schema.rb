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

ActiveRecord::Schema.define(version: 2019_12_12_074147) do

  create_table "badges", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "startdate"
    t.datetime "enddate"
    t.string "number"
    t.bigint "member_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_badges_on_member_id"
    t.index ["user_id"], name: "index_badges_on_user_id"
  end

  create_table "members", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "startdate"
    t.datetime "enddate"
    t.string "firstname"
    t.string "lastname"
    t.string "birthdate"
    t.integer "sexe"
    t.text "avatar"
    t.bigint "type_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["type_id"], name: "index_members_on_type_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "payments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "webtransaction"
    t.string "amount"
    t.bigint "subscription_id", null: false
    t.bigint "type_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subscription_id"], name: "index_payments_on_subscription_id"
    t.index ["type_id"], name: "index_payments_on_type_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "productimages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "alt"
    t.text "src"
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "photo"
    t.index ["product_id"], name: "index_productimages_on_product_id"
    t.index ["user_id"], name: "index_productimages_on_user_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "thumb"
    t.text "description"
    t.bigint "user_id"
    t.bigint "producttype_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "price_cents", default: 0, null: false
    t.index ["producttype_id"], name: "index_products_on_producttype_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "producttypes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "thumb"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_producttypes_on_user_id"
  end

  create_table "rates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "startdate"
    t.datetime "enddate"
    t.string "description"
    t.integer "value"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_rates_on_user_id"
  end

  create_table "searcheds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "keyword"
    t.string "location"
    t.bigint "user_id"
    t.bigint "producttype_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["producttype_id"], name: "index_searcheds_on_producttype_id"
    t.index ["user_id"], name: "index_searcheds_on_user_id"
  end

  create_table "subscriptions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "startdate"
    t.datetime "enddate"
    t.string "package"
    t.text "member"
    t.text "membersuplement"
    t.text "tennis"
    t.string "amount"
    t.string "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "startdate"
    t.datetime "enddate"
    t.string "label"
    t.string "value"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_types_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "startdate"
    t.datetime "enddate"
    t.datetime "hiredate"
    t.datetime "retirementdate"
    t.string "telephonenumber"
    t.integer "post"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "role"
    t.string "username"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.text "qrcode"
    t.integer "category"
    t.integer "subsidiary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "badges", "members"
  add_foreign_key "badges", "users"
  add_foreign_key "members", "types"
  add_foreign_key "members", "users"
  add_foreign_key "payments", "subscriptions"
  add_foreign_key "payments", "types"
  add_foreign_key "payments", "users"
  add_foreign_key "productimages", "products"
  add_foreign_key "productimages", "users"
  add_foreign_key "products", "producttypes"
  add_foreign_key "products", "users"
  add_foreign_key "producttypes", "users"
  add_foreign_key "rates", "users"
  add_foreign_key "searcheds", "producttypes"
  add_foreign_key "searcheds", "users"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "types", "users"
end
