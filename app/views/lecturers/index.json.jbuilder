json.array!(@lecturers) do |lecturer|
  json.extract! lecturer, :id, :lecturer_name, :gender, :dob, :nrc, :email, :address, :phone
  json.url lecturer_url(lecturer, format: :json)
end
