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

ActiveRecord::Schema[7.0].define(version: 2022_11_16_031727) do
  create_table "address_barangays", charset: "utf8mb4", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.bigint "region_id"
    t.bigint "province_id"
    t.bigint "district_id"
    t.bigint "city_municipality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_municipality_id"], name: "index_address_barangays_on_city_municipality_id"
    t.index ["district_id"], name: "index_address_barangays_on_district_id"
    t.index ["province_id"], name: "index_address_barangays_on_province_id"
    t.index ["region_id"], name: "index_address_barangays_on_region_id"
  end

  create_table "address_city_municipalities", charset: "utf8mb4", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.bigint "region_id"
    t.bigint "province_id"
    t.bigint "district_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["district_id"], name: "index_address_city_municipalities_on_district_id"
    t.index ["province_id"], name: "index_address_city_municipalities_on_province_id"
    t.index ["region_id"], name: "index_address_city_municipalities_on_region_id"
  end

  create_table "address_districts", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_address_districts_on_region_id"
  end

  create_table "address_provinces", charset: "utf8mb4", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_address_provinces_on_region_id"
  end

  create_table "address_regions", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", charset: "utf8mb4", force: :cascade do |t|
    t.string "content"
    t.bigint "post_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "friendly_id_slugs", charset: "utf8mb4", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, length: { slug: 70, scope: 70 }
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", length: { slug: 140 }
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "post_category_ships", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_post_category_ships_on_category_id"
    t.index ["post_id"], name: "index_post_category_ships_on_post_id"
  end

  create_table "posts", charset: "utf8mb4", force: :cascade do |t|
    t.text "title"
    t.text "content"
    t.string "address"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "delete_at"
    t.integer "comments_count", default: 0
    t.datetime "discarded_at"
    t.string "slug"
    t.string "unique_num"
    t.string "ip_address"
    t.string "image"
    t.bigint "address_region_id"
    t.bigint "address_province_id"
    t.bigint "address_district_id"
    t.bigint "address_city_municipality_id"
    t.bigint "address_barangay_id"
    t.index ["address_barangay_id"], name: "index_posts_on_address_barangay_id"
    t.index ["address_city_municipality_id"], name: "index_posts_on_address_city_municipality_id"
    t.index ["address_district_id"], name: "index_posts_on_address_district_id"
    t.index ["address_province_id"], name: "index_posts_on_address_province_id"
    t.index ["address_region_id"], name: "index_posts_on_address_region_id"
    t.index ["discarded_at"], name: "index_posts_on_discarded_at"
    t.index ["slug"], name: "index_posts_on_slug", unique: true
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
