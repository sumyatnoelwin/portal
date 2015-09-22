json.array!(@timetables) do |timetable|
  json.extract! timetable, :id, :section_id, :subject_id, :room_id, :lecturer_id, :start_time, :end_time, :description, :staff_id
  json.url timetable_url(timetable, format: :json)
end
