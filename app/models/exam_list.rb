# == Schema Information
#
# Table name: exam_list
# 
# t.integer  "course_id"
# t.integer  "section_id"
# t.integer  "subject_id"
# t.datetime "exam_date"
# t.datetime "created_at"
# t.datetime "updated_at"

class ExamList < ActiveRecord::Base
	validates :exam_date, :course_id, :subject_id, :title, :presence => true

	belongs_to :course
	belongs_to :section
	belongs_to :subject
	has_many :results
end
