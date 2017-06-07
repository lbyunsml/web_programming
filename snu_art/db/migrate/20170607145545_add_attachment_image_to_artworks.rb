class AddAttachmentImageToArtworks < ActiveRecord::Migration[5.0]
  def self.up
    change_table :artworks do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :artworks, :image
  end
end
