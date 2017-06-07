class Artwork < ApplicationRecord
  has_attached_file :image, :path => ":rails_root/public/artwork/:id_:filename"
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  belongs_to :artist
end
