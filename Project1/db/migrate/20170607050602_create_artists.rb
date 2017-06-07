class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :login_id
      t.string :password
      t.string :name
      t.text :description
      t.string :profile_img
      t.string :mail

      t.timestamps
    end
  end
end
