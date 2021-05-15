class AddUrlArtistsPhotoToArtists < ActiveRecord::Migration[6.1]
  def change
    add_column :artists, :url_artists_photo, :string
  end
end
