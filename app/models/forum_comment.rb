# == Schema Information
#
# Table name: forum_comment
#
# t.integer  "forum_id"
# t.string   "comment"
# t.integer  "author_id"
# t.datetime "created_at"
# t.datetime "updated_at"

class ForumComment < ActiveRecord::Base
	validates :forum_id, :comment, :author_id, :presence => true

	belong_to :forum
	belong_to :student
end
