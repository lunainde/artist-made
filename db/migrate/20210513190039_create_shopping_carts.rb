class CreateShoppingCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_carts do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :paid, default: false
      t.decimal :total, precision: 8, scale: 2, default: 0

      t.timestamps
    end
  end
end
