json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :scanned
  json.url ticket_url(ticket, format: :json)
end
