class ArtItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @art_items = policy_scope(ArtItem).order(created_at: :desc)
  end

  def show
    @art_item = ArtItem.find(params[:id])
    authorize @art_item
    @shopping_cart_item = ShoppingCartItem.new
    shopping_carts = ShoppingCart.where(user: current_user)
    shopping_cart = shopping_carts.find_by(paid: false)
    @existing_shopping_cart_item = shopping_cart.shopping_cart_items.find_by(art_item: @art_item)
  end
end
