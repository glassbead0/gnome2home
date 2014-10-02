json.array!(@vans) do |van|
  json.extract! van, :id, :driver, :direction, :seats_available, :seats_occupied
  json.url van_url(van, format: :json)
end
