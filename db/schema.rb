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

ActiveRecord::Schema.define(version: 20150803031132) do

  create_table "courses", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses_programs", id: false, force: :cascade do |t|
    t.integer "program_id"
    t.integer "course_id"
  end

  add_index "courses_programs", ["course_id", "program_id"], name: "index_courses_programs_on_course_id_and_program_id"

  create_table "lessons", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "held_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "course_id",  null: false
  end

  add_index "lessons", ["course_id"], name: "index_lessons_on_course_id"

  create_table "lessons_teachers", id: false, force: :cascade do |t|
    t.integer "lesson_id"
    t.integer "teacher_id"
  end

  add_index "lessons_teachers", ["lesson_id", "teacher_id"], name: "index_lessons_teachers_on_lesson_id_and_teacher_id"

  create_table "programs", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id",    null: false
  end

  add_index "students", ["user_id"], name: "index_students_on_user_id"

  create_table "teachers", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id",     null: false
  end

  add_index "teachers", ["user_id"], name: "index_teachers_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "name",            null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
