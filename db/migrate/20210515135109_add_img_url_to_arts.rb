class AddImgUrlToArts < ActiveRecord::Migration[6.1]
  def change
    add_column :arts, :img_url, :string
  end
end
