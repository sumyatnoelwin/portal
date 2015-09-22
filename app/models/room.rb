# == Schema Information
#
# Table name: room
# 
# t.string   "no"
# t.string   "room_name"
# t.string   "description"
# t.datetime "created_at"
# t.datetime "updated_at"

class Room < ActiveRecord::Base
	validates :no, :presence => true

	has_many :timetables
end
