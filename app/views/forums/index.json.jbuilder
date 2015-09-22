json.array!(@forums) do |forum|
  json.extract! forum, :id, :title, :description, :author_id, :date
  json.url forum_url(forum, format: :json)
end
