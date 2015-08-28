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

ActiveRecord::Schema.define(version: 20150828004412) do

  create_table "admin_configs", force: :cascade do |t|
    t.string   "copyright",                   limit: 255
    t.string   "introduction",                limit: 255
    t.string   "meta_title",                  limit: 255
    t.string   "meta_description",            limit: 255
    t.string   "meta_fb_admins",              limit: 255
    t.string   "meta_fb_app_id",              limit: 255
    t.string   "meta_twitter_site",           limit: 255
    t.string   "meta_og_article_publisher",   limit: 255
    t.string   "meta_publisher",              limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "meta_thumbnail_file_name",    limit: 255
    t.string   "meta_thumbnail_content_type", limit: 255
    t.integer  "meta_thumbnail_file_size",    limit: 4
    t.datetime "meta_thumbnail_updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "course_schedules", force: :cascade do |t|
    t.integer  "course_id",  limit: 4
    t.integer  "order",      limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "course_schedules", ["course_id"], name: "index_course_schedules_on_course_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.integer  "program_id",             limit: 4,     null: false
    t.string   "name",                   limit: 255,   null: false
    t.text     "summary",                limit: 65535
    t.text     "detail",                 limit: 65535
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "thumbnail_file_name",    limit: 255
    t.string   "thumbnail_content_type", limit: 255
    t.integer  "thumbnail_file_size",    limit: 4
    t.datetime "thumbnail_updated_at"
  end

  add_index "courses", ["program_id"], name: "index_courses_on_program_id", using: :btree

  create_table "lesson_schedules", force: :cascade do |t|
    t.integer  "course_schedule_id", limit: 4
    t.integer  "location_id",        limit: 4
    t.integer  "lesson_id",          limit: 4
    t.datetime "held_at",                      null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "lesson_schedules", ["course_schedule_id"], name: "index_lesson_schedules_on_course_schedule_id", using: :btree
  add_index "lesson_schedules", ["lesson_id"], name: "index_lesson_schedules_on_lesson_id", using: :btree
  add_index "lesson_schedules", ["location_id"], name: "index_lesson_schedules_on_location_id", using: :btree

  create_table "lessons", force: :cascade do |t|
    t.integer  "course_id",  limit: 4,   null: false
    t.integer  "teacher_id", limit: 4,   null: false
    t.string   "name",       limit: 255, null: false
    t.integer  "order",      limit: 4,   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "lessons", ["course_id"], name: "index_lessons_on_course_id", using: :btree
  add_index "lessons", ["teacher_id"], name: "index_lessons_on_teacher_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name",         limit: 255, null: false
    t.float    "latitude",     limit: 24
    t.float    "longitude",    limit: 24
    t.string   "phone_number", limit: 255
    t.string   "address",      limit: 255
    t.string   "website",      limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "payment_states", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "key",        limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "payment_state_id", limit: 4
    t.integer  "registration_id",  limit: 4
    t.integer  "user_id",          limit: 4, null: false
    t.integer  "point",            limit: 4
    t.integer  "amount",           limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "payments", ["payment_state_id"], name: "index_payments_on_payment_state_id", using: :btree
  add_index "payments", ["registration_id"], name: "index_payments_on_registration_id", using: :btree
  add_index "payments", ["user_id"], name: "index_payments_on_user_id", using: :btree

  create_table "pricings", force: :cascade do |t|
    t.integer  "price",          limit: 4, null: false
    t.integer  "discount_price", limit: 4, null: false
    t.integer  "point",          limit: 4, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "programs", force: :cascade do |t|
    t.integer  "category_id", limit: 4,                   null: false
    t.string   "name",        limit: 255,                 null: false
    t.boolean  "is_public",   limit: 1,   default: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "programs", ["category_id"], name: "index_programs_on_category_id", using: :btree

  create_table "registrations", force: :cascade do |t|
    t.integer  "course_schedule_id", limit: 4, null: false
    t.integer  "student_id",         limit: 4, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "registrations", ["course_schedule_id"], name: "index_registrations_on_course_schedule_id", using: :btree
  add_index "registrations", ["student_id"], name: "index_registrations_on_student_id", using: :btree

  create_table "reset_password_tokens", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,                   null: false
    t.string   "key",        limit: 255
    t.boolean  "expired",    limit: 1,   default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "reset_password_tokens", ["user_id"], name: "index_reset_password_tokens_on_user_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.integer  "user_id",    limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "students", ["user_id"], name: "index_students_on_user_id", using: :btree

  create_table "teachers", force: :cascade do |t|
    t.integer  "user_id",        limit: 4,     null: false
    t.string   "facebook_id",    limit: 255
    t.string   "google_plus_id", limit: 255
    t.string   "twitter_id",     limit: 255
    t.text     "description",    limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "teachers", ["user_id"], name: "index_teachers_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.string   "name",            limit: 255,                 null: false
    t.boolean  "is_admin",        limit: 1,   default: false
    t.datetime "deleted_at"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

end
