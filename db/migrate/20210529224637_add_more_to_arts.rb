class AddMoreToArts < ActiveRecord::Migration[6.1]
  def change
    add_column :arts, :artist, :string
    add_column :arts, :art_theme, :string
    add_column :arts, :art_format, :string
  end
end
