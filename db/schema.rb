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

ActiveRecord::Schema.define(version: 2020_03_05_073801) do

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.integer "available"
    t.integer "package_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["package_id"], name: "index_comments_on_package_id"
  end

  create_table "have_lists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "comment"
    t.index ["user_id"], name: "index_have_lists_on_user_id"
  end

  create_table "have_lists_packages", force: :cascade do |t|
    t.integer "have_list_id"
    t.integer "package_id"
    t.index ["have_list_id"], name: "index_have_lists_packages_on_have_list_id"
    t.index ["package_id"], name: "index_have_lists_packages_on_package_id"
  end

  create_table "packages", force: :cascade do |t|
    t.string "provider"
    t.string "name"
    t.string "description"
    t.integer "price"
    t.integer "sort"
    t.string "logo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "packages_wants_lists", force: :cascade do |t|
    t.integer "want_list_id"
    t.integer "package_id"
    t.index ["package_id"], name: "index_packages_wants_lists_on_package_id"
    t.index ["want_list_id"], name: "index_packages_wants_lists_on_want_list_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.boolean "active", default: false
  end

  create_table "wants_lists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_wants_lists_on_user_id"
  end

  add_foreign_key "comments", "packages"
  add_foreign_key "have_lists", "users"
  add_foreign_key "wants_lists", "users"
end
