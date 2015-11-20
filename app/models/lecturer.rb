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

	validates :email, :uniqueness => true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => 'Email format is invalid'	

	has_many :teching_schedules
	has_many :timetables

	validates_date :dob, on_or_before: lambda { 20.years.ago }, :on_or_before_message => 'must be valid date of birth'

end