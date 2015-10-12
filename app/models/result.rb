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
	validates :exam_id, :student_id, :setion_id, :subject_id, :result, :presence => true

	# belong_to :student 
	# belong_to :exam_list
	# belong_to :section
	# belong_to :subject

end
