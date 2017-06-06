class Artwork < ApplicationRecord
  belongs_to :artist
  mount_uploader :img_path, ImageUploader
end
