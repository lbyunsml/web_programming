json.extract! artwork, :id, :title, :img_path, :description, :category, :artist_id, :created_at, :updated_at
json.url artwork_url(artwork, format: :json)
