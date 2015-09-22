json.array!(@subjects) do |subject|
  json.extract! subject, :id, :subject_name, :course_id, :description
  json.url subject_url(subject, format: :json)
end
