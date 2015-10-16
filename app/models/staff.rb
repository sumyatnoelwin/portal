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
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	validates :staff_name, :email, :dob, :presence => true
	validates :nrc, :post, :address, :presence => true

	has_many :ebooks
	has_many :student_registers
	has_many :timetables
end
