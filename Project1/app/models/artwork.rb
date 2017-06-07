class Artwork < ApplicationRecord
  belongs_to :artist
  has_attached_file :image
  validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
