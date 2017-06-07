json.extract! artist, :id, :login_id, :password, :name, :description, :profile_img, :mail, :created_at, :updated_at
json.url artist_url(artist, format: :json)
