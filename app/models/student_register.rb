# == Schema Information
#
# Table name: student_register
#
# t.integer  "student_id"
# t.integer  "section_id"
# t.integer  "tution_fees"
# t.integer  "exam_fees"
# t.datetime "register_date"
# t.boolean  "complete_tf"
# t.boolean  "complete_ef"
# t.integer  "staff_id"
# t.string   "remark"
# t.datetime "created_at"
# t.datetime "updated_at"

class StudentRegister < ActiveRecord::Base
	validates :student_id, :section_id, :tution_fees, :exam_fees, :staff_id, :presence => true
	validates :student_id, uniqueness: { scope: :section_id }

	belongs_to :student
	belongs_to :section
	belongs_to :staff 
end
