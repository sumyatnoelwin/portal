# == Schema Information
#
# Table name: subject
# 
# t.string   "subject_name"
# t.integer  "course_id"
# t.string   "description"
# t.datetime "created_at"
# t.datetime "updated_at"

class Subject < ActiveRecord::Base
	validates :subject_name, :course_id, :presence => true

	belongs_to :course
	has_many :exam_lists
	has_many :results
	has_many :timetables
	
end
