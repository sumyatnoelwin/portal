json.array!(@teaching_schedules) do |teaching_schedule|
  json.extract! teaching_schedule, :id, :lecturer_id, :section_id, :subject_id, :start_date, :end_date, :total, :remark, :description
  json.url teaching_schedule_url(teaching_schedule, format: :json)
end
