# == Schema Information
#
# Table name: category
# 
#   t.string   "category_name"
# 	t.datetime "created_at"
# 	t.datetime "updated_at"



class Category < ActiveRecord::Base
	validates :category_name, :presence => true, :uniqueness => true

	has_many :ebooks
end
