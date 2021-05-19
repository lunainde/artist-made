class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]

  has_many :shopping_carts
  has_many :orders
  after_create :initialize_empty_shopping_cart

  # not private, because we want to re-use it, when we set an old shopping cart to paid
  def initialize_empty_shopping_cart
    ShoppingCart.create!(total: 0, user: self)
  end
end
