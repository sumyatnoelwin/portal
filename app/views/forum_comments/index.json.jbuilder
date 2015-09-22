json.array!(@forum_comments) do |forum_comment|
  json.extract! forum_comment, :id, :forum_id, :comment, :author_id
  json.url forum_comment_url(forum_comment, format: :json)
end
