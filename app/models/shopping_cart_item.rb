class ShoppingCartItem < ApplicationRecord
  belongs_to :art_item
  belongs_to :shopping_cart
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }, presence: true

end
