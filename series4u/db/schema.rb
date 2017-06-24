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

ActiveRecord::Schema.define(version: 20170623180851) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chapter_acts", force: :cascade do |t|
    t.bigint "actor_id"
    t.bigint "chapter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_id"], name: "index_chapter_acts_on_actor_id"
    t.index ["chapter_id"], name: "index_chapter_acts_on_chapter_id"
  end

  create_table "chapter_directeds", force: :cascade do |t|
    t.bigint "director_id"
    t.bigint "chapter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_chapter_directeds_on_chapter_id"
    t.index ["director_id"], name: "index_chapter_directeds_on_director_id"
  end

  create_table "chapter_ratings", force: :cascade do |t|
    t.integer "stars"
    t.bigint "view_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["view_id"], name: "index_chapter_ratings_on_view_id"
  end

  create_table "chapter_reviews", force: :cascade do |t|
    t.text "content"
    t.bigint "view_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["view_id"], name: "index_chapter_reviews_on_view_id"
  end

  create_table "chapters", force: :cascade do |t|
    t.text "summary"
    t.bigint "user_id"
    t.bigint "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["season_id"], name: "index_chapters_on_season_id"
    t.index ["user_id"], name: "index_chapters_on_user_id"
  end

  create_table "directors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kids", force: :cascade do |t|
    t.integer "user_id"
    t.integer "kiddy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "number"
    t.date "release_date"
    t.bigint "serie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["serie_id"], name: "index_seasons_on_serie_id"
  end

  create_table "serie_acts", force: :cascade do |t|
    t.bigint "actor_id"
    t.bigint "serie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_id"], name: "index_serie_acts_on_actor_id"
    t.index ["serie_id"], name: "index_serie_acts_on_serie_id"
  end

  create_table "serie_directeds", force: :cascade do |t|
    t.bigint "director_id"
    t.bigint "serie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["director_id"], name: "index_serie_directeds_on_director_id"
    t.index ["serie_id"], name: "index_serie_directeds_on_serie_id"
  end

  create_table "serie_ratings", force: :cascade do |t|
    t.integer "stars"
    t.bigint "user_id"
    t.bigint "serie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["serie_id"], name: "index_serie_ratings_on_serie_id"
    t.index ["user_id"], name: "index_serie_ratings_on_user_id"
  end

  create_table "serie_reviews", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "serie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["serie_id"], name: "index_serie_reviews_on_serie_id"
    t.index ["user_id"], name: "index_serie_reviews_on_user_id"
  end

  create_table "series", force: :cascade do |t|
    t.string "country"
    t.string "genre"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "picture"
    t.index ["user_id"], name: "index_series_on_user_id"
  end

  create_table "stories", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.text "description"
    t.integer "role", default: 1
    t.string "full_name"
    t.bigint "facebook_id"
    t.string "facebook_name"
    t.string "username"
    t.string "picture"
    t.string "provider"
    t.string "uid"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "views", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "chapter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_views_on_chapter_id"
    t.index ["user_id"], name: "index_views_on_user_id"
  end

  add_foreign_key "chapter_acts", "actors"
  add_foreign_key "chapter_acts", "chapters"
  add_foreign_key "chapter_directeds", "chapters"
  add_foreign_key "chapter_directeds", "directors"
  add_foreign_key "chapter_ratings", "views"
  add_foreign_key "chapter_reviews", "views"
  add_foreign_key "chapters", "seasons"
  add_foreign_key "chapters", "users"
  add_foreign_key "serie_acts", "actors"
  add_foreign_key "serie_acts", "series", column: "serie_id"
  add_foreign_key "serie_directeds", "directors"
  add_foreign_key "serie_directeds", "series", column: "serie_id"
  add_foreign_key "serie_ratings", "series", column: "serie_id"
  add_foreign_key "serie_ratings", "users"
  add_foreign_key "serie_reviews", "series", column: "serie_id"
  add_foreign_key "serie_reviews", "users"
  add_foreign_key "series", "users"
  add_foreign_key "views", "chapters"
  add_foreign_key "views", "users"
end
