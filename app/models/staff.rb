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
	validates :staff_name, :gender, :dob, :presence => true
	validates :nrc, :post, :address, :presence => true

	has_many :ebooks
	has_many :student_registers
	has_many :timetables
end
