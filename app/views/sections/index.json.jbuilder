json.array!(@sections) do |section|
  json.extract! section, :id, :section_name, :course_id, :start_date, :end_date, :start_time, :end_time, :description
  json.url section_url(section, format: :json)
end
