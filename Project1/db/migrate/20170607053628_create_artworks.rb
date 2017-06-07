class CreateArtworks < ActiveRecord::Migration[5.1]
  def change
    create_table :artworks do |t|
      t.string :title
      t.string :img_path
      t.text :description
      t.string :category
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
