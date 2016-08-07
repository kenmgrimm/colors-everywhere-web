json.extract! painting, :id, :latitude, :longitude, :direction_degrees, :created_at, :updated_at
json.url painting_url(painting, format: :json)