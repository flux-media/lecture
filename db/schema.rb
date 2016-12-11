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

ActiveRecord::Schema.define(version: 20160404025708) do

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
    t.string   "slug",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "categories_courses", force: :cascade do |t|
    t.integer  "category_id", limit: 4
    t.integer  "course_id",   limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "categories_courses", ["category_id", "course_id"], name: "index_categories_courses_on_category_id_and_course_id", unique: true, using: :btree
  add_index "categories_courses", ["category_id"], name: "index_categories_courses_on_category_id", using: :btree
  add_index "categories_courses", ["course_id"], name: "index_categories_courses_on_course_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.integer  "teacher_id",             limit: 4
    t.boolean  "is_public",                            default: false
    t.boolean  "is_on_sale",                           default: false
    t.boolean  "is_full",                              default: false
    t.boolean  "is_past",                              default: false
    t.string   "slug",                   limit: 255,                   null: false
    t.string   "title",                  limit: 255,                   null: false
    t.string   "date",                   limit: 255,                   null: false
    t.string   "location",               limit: 255
    t.integer  "max_students",           limit: 4,     default: 80
    t.integer  "students_enrolled",      limit: 4,     default: 0
    t.integer  "duration",               limit: 4,     default: 2
    t.integer  "original_price",         limit: 4,     default: 0
    t.integer  "sale_price",             limit: 4,     default: 0
    t.text     "summary",                limit: 65535
    t.text     "detail",                 limit: 65535
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "thumbnail_file_name",    limit: 255
    t.string   "thumbnail_content_type", limit: 255
    t.integer  "thumbnail_file_size",    limit: 4
    t.datetime "thumbnail_updated_at"
  end

  add_index "courses", ["teacher_id"], name: "index_courses_on_teacher_id", using: :btree

  create_table "registrations", force: :cascade do |t|
    t.integer  "course_id",  limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "registrations", ["course_id"], name: "index_registrations_on_course_id", using: :btree
  add_index "registrations", ["user_id"], name: "index_registrations_on_user_id", using: :btree

  create_table "reset_password_tokens", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,                   null: false
    t.string   "key",        limit: 255
    t.boolean  "expired",                default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "reset_password_tokens", ["user_id"], name: "index_reset_password_tokens_on_user_id", using: :btree

  create_table "teachers", force: :cascade do |t|
    t.string   "name",                   limit: 255,   null: false
    t.string   "blog_url",               limit: 255
    t.string   "facebook_url",           limit: 255
    t.string   "twitter_id",             limit: 255
    t.text     "description",            limit: 65535
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "thumbnail_file_name",    limit: 255
    t.string   "thumbnail_content_type", limit: 255
    t.integer  "thumbnail_file_size",    limit: 4
    t.datetime "thumbnail_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.string   "name",            limit: 255,                 null: false
    t.boolean  "is_admin",                    default: false
    t.datetime "deleted_at"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

end
