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

	validates :subject_id, uniqueness: { scope: :exam_date }
	validates_date :exam_date, after: lambda { Date.current }, :after_message => 'must be valid exam date'
	belongs_to :course
	belongs_to :section
	belongs_to :subject
	has_many :results
end
