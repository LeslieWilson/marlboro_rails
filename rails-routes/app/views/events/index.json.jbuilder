json.array!(@events) do |event|
  json.extract! event, :id, :location
  json.url event_url(event, format: :json)
end
