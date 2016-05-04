# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160218080630) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "answers", force: :cascade do |t|
    t.text     "answer_description"
    t.boolean  "answer_is_true"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "question_id"
    t.string   "image"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "pass_codes", force: :cascade do |t|
    t.string   "passcode"
    t.boolean  "pass_code_is_finished"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "poll_id"
    t.integer  "person_id"
  end

  add_index "pass_codes", ["person_id"], name: "index_pass_codes_on_person_id", using: :btree
  add_index "pass_codes", ["poll_id"], name: "index_pass_codes_on_poll_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "person_first_name"
    t.string   "person_last_name"
    t.text     "person_descr"
    t.date     "person_birthday"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "poll_images", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "poll_id"
    t.string   "image"
  end

  add_index "poll_images", ["poll_id"], name: "index_poll_images_on_poll_id", using: :btree

  create_table "polls", force: :cascade do |t|
    t.string   "poll_name"
    t.text     "poll_description"
    t.date     "poll_start_date"
    t.date     "poll_finish_date"
    t.text     "poll_feedback"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "question_images", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
    t.integer  "question_id"
  end

  add_index "question_images", ["question_id"], name: "index_question_images_on_question_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "question_header"
    t.text     "question_description"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "poll_id"
  end

  add_index "questions", ["poll_id"], name: "index_questions_on_poll_id", using: :btree

  create_table "records", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "pass_code_id"
    t.integer  "answer_id"
  end

  add_index "records", ["answer_id"], name: "index_records_on_answer_id", using: :btree
  add_index "records", ["pass_code_id"], name: "index_records_on_pass_code_id", using: :btree

  add_foreign_key "answers", "questions"
  add_foreign_key "pass_codes", "people"
  add_foreign_key "pass_codes", "polls"
  add_foreign_key "poll_images", "polls"
  add_foreign_key "question_images", "questions"
  add_foreign_key "questions", "polls"
  add_foreign_key "records", "answers"
  add_foreign_key "records", "pass_codes"
end
