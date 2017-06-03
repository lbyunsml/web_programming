class CreateArtworks < ActiveRecord::Migration[5.0]
  def change
    create_table :artworks do |t|
      t.string :name
      t.string :img_path
      t.string :description
      t.string :category
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
