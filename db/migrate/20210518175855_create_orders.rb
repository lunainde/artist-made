class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :state
      t.decimal :amount, precision: 8, scale: 2
      t.string :checkout_session_id
      t.references :user, null: false, foreign_key: true
      t.references :shopping_cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
