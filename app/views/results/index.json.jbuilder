json.array!(@results) do |result|
  json.extract! result, :id, :exam_id, :student_id, :setion_id, :subject_id, :result, :date, :remark
  json.url result_url(result, format: :json)
end
