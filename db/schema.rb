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

ActiveRecord::Schema.define(version: 20180602141937) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "intakes", force: :cascade do |t|
    t.bigint "questionnaire_id"
    t.bigint "tag_id"
    t.index ["questionnaire_id"], name: "index_intakes_on_questionnaire_id"
    t.index ["tag_id"], name: "index_intakes_on_tag_id"
  end

  create_table "questionnaire_questions", force: :cascade do |t|
    t.bigint "questionnaire_id"
    t.bigint "question_id"
    t.index ["question_id"], name: "index_questionnaire_questions_on_question_id"
    t.index ["questionnaire_id"], name: "index_questionnaire_questions_on_questionnaire_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.string "title"
  end

  create_table "questions", force: :cascade do |t|
    t.string "text"
    t.string "answers"
    t.bigint "section_id"
    t.index ["section_id"], name: "index_questions_on_section_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "name"
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "tag_id"
    t.integer "association_tag_id"
    t.integer "association_tag_id_2"
    t.index ["question_id"], name: "index_taggings_on_question_id"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_tags_on_category_id"
  end

  add_foreign_key "intakes", "questionnaires"
  add_foreign_key "intakes", "tags"
  add_foreign_key "questionnaire_questions", "questionnaires"
  add_foreign_key "questionnaire_questions", "questions"
  add_foreign_key "questions", "sections"
  add_foreign_key "taggings", "questions"
  add_foreign_key "taggings", "tags"
  add_foreign_key "tags", "categories"
end
