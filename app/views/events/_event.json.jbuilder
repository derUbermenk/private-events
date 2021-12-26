json.extract! event, :id, :name, :data, :location, :created_at, :updated_at
json.url event_url(event, format: :json)
