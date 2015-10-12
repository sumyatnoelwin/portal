# == Schema Information
#
# Table name: forum
#
# t.string   "title"
# t.string   "description"
# t.integer  "author_id"
# t.datetime "date"
# t.datetime "created_at"
# t.datetime "updated_at"

class Forum < ActiveRecord::Base
	validates :title, :author_id, :presence => true

	belongs_to :student
	has_many :comments
end
