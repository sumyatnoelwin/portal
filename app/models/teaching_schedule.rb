# == Schema Information
#
# Table name: teaching_schedule
# 
# t.integer  "lecturer_id"
# t.integer  "section_id"
# t.integer  "subject_id"
# t.datetime "start_date"
# t.datetime "end_date"
# t.string   "total"
# t.string   "remark"
# t.string   "description"
# t.datetime "created_at"
# t.datetime "updated_at"

class TeachingSchedule < ActiveRecord::Base
	validates :lecturer_id, :section_id, :subject_id, :presence => true
	validates :start_date, :total, :presence => true

	belongs_to :lecturer
	belongs_to :section
	belongs_to :subject
end
