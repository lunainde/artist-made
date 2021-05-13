class ArtItem < ApplicationRecord
  belongs_to :art
  has_many :shopping_cart_items
end
