# == Schema Information
#
# Table name: course
#
# t.string   "course_name"
# t.string   "related_field"
# t.string   "description"
# t.datetime "created_at"
# t.datetime "updated_at"
#

class Course < ActiveRecord::Base
	validates :course_name, :related_field, :presence => true

	has_many :subjects
	has_many :sections
	has_many :exam_lists
end
