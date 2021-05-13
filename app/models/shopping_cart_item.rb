class ShoppingCartItem < ApplicationRecord
  belongs_to :art_item
  belongs_to :shopping_cart
end
