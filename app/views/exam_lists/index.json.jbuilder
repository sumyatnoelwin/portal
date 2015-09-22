json.array!(@exam_lists) do |exam_list|
  json.extract! exam_list, :id, :course_id, :section_id, :subject_id, :exam_date
  json.url exam_list_url(exam_list, format: :json)
end
