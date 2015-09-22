json.array!(@rooms) do |room|
  json.extract! room, :id, :no, :room_name, :description
  json.url room_url(room, format: :json)
end
