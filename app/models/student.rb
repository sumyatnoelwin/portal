# == Schema Information
#
# Table name: student
# 
# t.string   "student_name"
# t.string   "reg_no"
# t.string   "profile"
# t.integer  "gender"
# t.datetime "dob"
# t.string   "nrc"
# t.string   "address"
# t.string   "email"
# t.string   "phone"
# t.integer  "section_id"
# t.string   "guardian"
# t.string   "relation"
# t.datetime "created_at"
# t.datetime "updated_at"

class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    mount_uploader :profile, ProfileUploader

	extend Enumerize

	enumerize :gender, in: { male: 1, female: 2 }, predicates: true

	validates :student_name, :reg_no, :gender, :dob, :presence => true
	validates :nrc, :address, :email, :section_id, :presence => true

	belongs_to :section
	has_many :forums
	has_many :results
end