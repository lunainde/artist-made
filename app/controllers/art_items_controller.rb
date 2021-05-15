class ArtItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @art_items = policy_scope(ArtItem).order(created_at: :desc)
  end

  def show
    @art_item = ArtItem.find(params[:id])
    authorize @art_item
    @shopping_cart_item = ShoppingCartItem.new
  end
end
