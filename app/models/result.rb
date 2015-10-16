# == Schema Information
#
# Table name: result
#
# t.integer  "exam_id"
# t.integer  "student_id"
# t.integer  "section_id"
# t.integer  "subject_id"
# t.string   "result"
# t.datetime "date"
# t.string   "remark"
# t.datetime "created_at"
# t.datetime "updated_at"

class Result < ActiveRecord::Base
	validates :exam_id, :student_id, :section_id, :subject_id, :result, :presence => true

	belongs_to :student 
	belongs_to :exam_list
	belongs_to :section
	belongs_to :subject

end
