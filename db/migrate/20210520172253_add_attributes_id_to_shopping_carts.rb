class AddAttributesIdToShoppingCarts < ActiveRecord::Migration[6.1]
  def change
    add_column :shopping_carts, :checkout_session_id, :string
    add_column :shopping_carts, :state, :string
  end
end
