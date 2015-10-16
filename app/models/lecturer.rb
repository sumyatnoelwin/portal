# == Schema Information
#
# Table name: lecturer
# 
# t.string   "lecturer_name"
# t.integer  "gender"
# t.datetime "dob"
# t.string   "nrc"
# t.string   "email"
# t.string   "address"
# t.string   "phone"
# t.datetime "created_at"
# t.datetime "updated_at"

class Lecturer < ActiveRecord::Base
	validates :lecturer_name, :email, :presence => true
	validates :address, :dob, :presence => true		

	has_many :teching_schedules
	has_many :timetables

end