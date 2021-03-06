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

ActiveRecord::Schema.define(version: 2019_07_12_192445) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.boolean "public", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "comment"
    t.bigint "tab_id"
    t.bigint "question_id"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_comments_on_question_id"
    t.index ["tab_id"], name: "index_comments_on_tab_id"
  end

  create_table "outputs", force: :cascade do |t|
    t.text "output"
    t.bigint "tab_id"
    t.bigint "question_id"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_outputs_on_question_id"
    t.index ["tab_id"], name: "index_outputs_on_tab_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "subject"
    t.boolean "public", default: false
    t.bigint "theme_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["theme_id"], name: "index_questions_on_theme_id"
  end

  create_table "solutions", force: :cascade do |t|
    t.text "solution"
    t.bigint "tab_id"
    t.bigint "question_id"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_solutions_on_question_id"
    t.index ["tab_id"], name: "index_solutions_on_tab_id"
  end

  create_table "tabs", force: :cascade do |t|
    t.string "name"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_tabs_on_question_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id"
    t.boolean "public", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_themes_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "categories", "users"
  add_foreign_key "comments", "questions"
  add_foreign_key "comments", "tabs"
  add_foreign_key "outputs", "questions"
  add_foreign_key "outputs", "tabs"
  add_foreign_key "questions", "themes"
  add_foreign_key "solutions", "questions"
  add_foreign_key "solutions", "tabs"
  add_foreign_key "tabs", "questions"
  add_foreign_key "themes", "categories"
end
