# == Schema Information
#
# Table name: ebook
# 
# t.string   "ebook_name"
# t.string   "file"
# t.string   "about"
# t.integer  "category_id"
# t.integer  "uploader_id"
# t.datetime "created_at"
# t.datetime "updated_at"

class Ebook < ActiveRecord::Base
	validates :ebook_name, :file, :category_id, :uploader_id, :presence => true

	mount_uploader :file, FileuploadUploader
	belongs_to :category
	belongs_to :staff


end

