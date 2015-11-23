# == Schema Information
#
# Table name: timetable
#
# t.integer  "section_id"
# t.integer  "subject_id"
# t.integer  "room_id"
# t.integer  "lecturer_id"
# t.integer  "lecturer_id2"
# t.datetime "date"
# t.datetime "start_time"
# t.datetime "end_time"
# t.string   "description"
# t.integer  "staff_id"
# t.datetime "created_at"
# t.datetime "updated_at"

class Timetable < ActiveRecord::Base
	validates :section_id, :subject_id, :lecturer_id, :date, :start_time, :end_time, :presence => true

	validates :room_id, uniqueness: { scope: :date && :start_time }
	validates :lecturer_id, uniqueness: { scope: :date && :start_time }
	validates_datetime :end_time, :after => :start_time, :after_message => "must be after start time" 
	validates_time :start_time, :between => ['7:00am', '9:00pm']

	belongs_to :section
	belongs_to :subject
	belongs_to :lecturer
	belongs_to :staff
	belongs_to :room 
end
