json.array!(@students) do |student|
  json.extract! student, :id, :student_name, :reg_no, :profile, :gender, :dob, :nrc, :address, :email, :phone, :section_id, :guardian, :relation
  json.url student_url(student, format: :json)
end
