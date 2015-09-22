json.array!(@ebooks) do |ebook|
  json.extract! ebook, :id, :ebook_name, :file, :about, :category_id, :uploader_id
  json.url ebook_url(ebook, format: :json)
end
