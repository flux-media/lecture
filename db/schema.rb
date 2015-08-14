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

ActiveRecord::Schema.define(version: 20150813005834) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "detail"
    t.string   "thumbnail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "program_id", null: false
  end

  add_index "courses", ["program_id"], name: "index_courses_on_program_id"

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
    t.string   "name",                        null: false
    t.boolean  "is_public",   default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "category_id",                 null: false
  end

  add_index "programs", ["category_id"], name: "index_programs_on_category_id"

  create_table "registrations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "course_id",  null: false
    t.integer  "student_id", null: false
  end

  add_index "registrations", ["course_id"], name: "index_registrations_on_course_id"
  add_index "registrations", ["student_id"], name: "index_registrations_on_student_id"

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
    t.string   "email"
    t.string   "password_digest"
    t.string   "name",                            null: false
    t.boolean  "is_admin",        default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
