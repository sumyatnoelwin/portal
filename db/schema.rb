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

ActiveRecord::Schema.define(version: 20150912233319) do

  create_table "categories", force: true do |t|
    t.string   "category_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "course_name"
    t.string   "related_field"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ebooks", force: true do |t|
    t.string   "ebook_name"
    t.string   "file"
    t.string   "about"
    t.integer  "category_id"
    t.integer  "uploader_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exam_lists", force: true do |t|
    t.integer  "course_id"
    t.integer  "section_id"
    t.integer  "subject_id"
    t.datetime "exam_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forum_comments", force: true do |t|
    t.integer  "forum_id"
    t.string   "comment"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forums", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "author_id"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lecturers", force: true do |t|
    t.string   "lecturer_name"
    t.integer  "gender"
    t.datetime "dob"
    t.string   "nrc"
    t.string   "email"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", force: true do |t|
    t.integer  "exam_id"
    t.integer  "student_id"
    t.integer  "setion_id"
    t.integer  "subject_id"
    t.string   "result"
    t.datetime "date"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", force: true do |t|
    t.string   "no"
    t.string   "room_name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.string   "section_name"
    t.integer  "course_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "staffs", force: true do |t|
    t.string   "staff_name"
    t.integer  "gender"
    t.datetime "dob"
    t.string   "nrc"
    t.string   "post"
    t.string   "email"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_registers", force: true do |t|
    t.integer  "student_id"
    t.integer  "section_id"
    t.integer  "tution_fees"
    t.integer  "exam_fees"
    t.datetime "register_date"
    t.boolean  "complete_tf"
    t.boolean  "complete_ef"
    t.integer  "staff_id"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "student_name"
    t.string   "reg_no"
    t.string   "profile"
    t.integer  "gender"
    t.datetime "dob"
    t.string   "nrc"
    t.string   "address"
    t.string   "email"
    t.string   "phone"
    t.integer  "section_id"
    t.string   "guardian"
    t.string   "relation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", force: true do |t|
    t.string   "subject_name"
    t.integer  "course_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teaching_schedules", force: true do |t|
    t.integer  "lecturer_id"
    t.integer  "section_id"
    t.integer  "subject_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "total"
    t.string   "remark"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timetables", force: true do |t|
    t.integer  "section_id"
    t.integer  "subject_id"
    t.integer  "room_id"
    t.integer  "lecturer_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "description"
    t.integer  "staff_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
