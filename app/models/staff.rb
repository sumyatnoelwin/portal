# == Schema Information
#
# Table name: staff
# 
# t.string   "staff_name"
# t.integer  "gender"
# t.datetime "dob"
# t.string   "nrc"
# t.string   "post"
# t.string   "email"
# t.string   "address"
# t.string   "phone"
# t.datetime "created_at"
# t.datetime "updated_at"
    
class Staff < ActiveRecord::Base
	validates :staff_name, :email, :dob, :presence => true
	validates :nrc, :post, :address, :presence => true

	validates :email, :uniqueness => true		
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => 'Email format is invalid'	

	has_many :ebooks
	has_many :student_registers
	has_many :timetables

	validates_date :dob, on_or_before: lambda { 15.years.ago }, :on_or_before_message => 'must be valid date of birth'
end
