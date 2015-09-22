json.array!(@staffs) do |staff|
  json.extract! staff, :id, :staff_name, :gender, :dob, :nrc, :post, :email, :address, :phone
  json.url staff_url(staff, format: :json)
end
