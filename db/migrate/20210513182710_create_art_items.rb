class CreateArtItems < ActiveRecord::Migration[6.1]
  def change
    create_table :art_items do |t|
      t.references :art, null: false, foreign_key: true
      t.string :format
      t.decimal :price, precision: 8, scale: 2
      t.integer :quantity

      t.timestamps
    end
  end
end
