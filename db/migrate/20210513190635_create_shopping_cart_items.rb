class CreateShoppingCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_cart_items do |t|
      t.decimal :price, precision: 8, scale: 2
      t.integer :quantity
      t.references :art_item, null: false, foreign_key: true
      t.references :shopping_cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
