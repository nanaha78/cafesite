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

ActiveRecord::Schema.define(version: 2023_02_14_130336) do

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id", null: false
    t.integer "dog_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dog_id"], name: "index_comments_on_dog_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "cafe_name"
    t.string "adress"
    t.string "price"
    t.string "recommend"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "image"
    t.string "youtube_url"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "dog_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dog_id"], name: "index_likes_on_dog_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "tag_map2s", force: :cascade do |t|
    t.integer "dog_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dog_id"], name: "index_tag_map2s_on_dog_id"
    t.index ["tag_id"], name: "index_tag_map2s_on_tag_id"
  end

  create_table "tag_maps", force: :cascade do |t|
    t.integer "dog_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dog_id"], name: "index_tag_maps_on_dog_id"
    t.index ["tag_id"], name: "index_tag_maps_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.text "profile"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "dogs"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "dogs"
  add_foreign_key "likes", "users"
  add_foreign_key "tag_map2s", "dogs"
  add_foreign_key "tag_map2s", "tags"
  add_foreign_key "tag_maps", "dogs"
  add_foreign_key "tag_maps", "tags"
end
