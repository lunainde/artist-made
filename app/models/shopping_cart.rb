class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :shopping_cart_items
  has_many :orders
end
