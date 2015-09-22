# == Schema Information
#
# Table name: section
# 
# t.string   "section_name"
# t.integer  "course_id"
# t.datetime "start_date"
# t.datetime "end_date"
# t.datetime "start_time"
# t.datetime "end_time"
# t.string   "description"
# t.datetime "created_at"
# t.datetime "updated_at"

class Section < ActiveRecord::Base
	validates :section_name, :course_id, :start_date, :end_date, :presence => true
	validates :start_time, :end_time, :presence => true

	has_many :teaching_schedules
	has_many :exam_lists
	belongs_to :course
	has_many :results
	has_many :timetables

end
