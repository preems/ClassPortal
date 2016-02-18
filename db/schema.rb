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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160218085330) do
=======
ActiveRecord::Schema.define(version: 20160218090518) do
>>>>>>> f67364483437a18eed8d721b03600a7ac8a612ba

  create_table "courses", force: :cascade do |t|
    t.string   "number"
    t.string   "title"
    t.string   "desc"
    t.date     "startDate"
    t.date     "endDate"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses_users", id: false, force: :cascade do |t|
    t.integer "course_id"
    t.integer "user_id"
    t.string  "status"
    t.string  "grade"
  end

  add_index "courses_users", ["course_id"], name: "index_courses_users_on_course_id"
  add_index "courses_users", ["user_id"], name: "index_courses_users_on_user_id"

<<<<<<< HEAD
  create_table "enrollments", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.string   "status"
    t.string   "grade"
=======
  create_table "notifications", force: :cascade do |t|
    t.string   "message"
    t.integer  "course_id"
>>>>>>> f67364483437a18eed8d721b03600a7ac8a612ba
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  add_index "enrollments", ["course_id"], name: "index_enrollments_on_course_id"
  add_index "enrollments", ["user_id"], name: "index_enrollments_on_user_id"

  create_table "requests", force: :cascade do |t|
    t.string   "status"
    t.integer  "course_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "requests", ["course_id"], name: "index_requests_on_course_id"
  add_index "requests", ["user_id"], name: "index_requests_on_user_id"
=======
  add_index "notifications", ["course_id"], name: "index_notifications_on_course_id"
>>>>>>> f67364483437a18eed8d721b03600a7ac8a612ba

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "role"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
