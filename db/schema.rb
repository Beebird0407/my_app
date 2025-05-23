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

ActiveRecord::Schema[7.1].define(version: 2025_05_21_080532) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "images", force: :cascade do |t|
    t.string "name"
    t.string "file"
    t.float "ave_value"
    t.integer "theme_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "image_id", null: false
    t.integer "score", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "rated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["image_id", "user_id"], name: "index_ratings_on_image_id_and_user_id", unique: true
    t.index ["image_id"], name: "index_ratings_on_image_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "scores", force: :cascade do |t|
    t.integer "value"
    t.bigint "image_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_id"], name: "index_scores_on_image_id"
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "name"
    t.integer "qty_items"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  create_table "values", force: :cascade do |t|
    t.integer "user_id"
    t.integer "image_id"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ratings", "images"
  add_foreign_key "ratings", "users"
  add_foreign_key "scores", "images"
  add_foreign_key "scores", "users"
end
