class ShoppingCartItemsController < ApplicationController

  def create
    shopping_cart = current_user.shopping_carts.find_by(paid: false)
    @art_item = ArtItem.find(params[:art_item_id])
    quantity = get_params[:quantity]
    price = quantity * @art_item.price
    @shopping_cart_item = ShoppingCartItem.new(art_item: @art_item, shopping_cart: shopping_cart, quantity: quantity, price: price)
    authorize @shopping_cart_item
    if @shopping_cart_item.save
      # raise
      redirect_to art_path(@art_item.art),
      alert: "#{ @shopping_cart_item.quantity } x #{@shopping_cart_item.art_item.art.title} - #{ @shopping_cart_item.art_item.format } added to shopping cart!"
      # @message = "Added #{ @shopping_cart_item.quantity } #{ @shopping_cart_item.art_item.art.title } to Shopping cart"
      # render 'art_items/show.html.erb'
    else
      render 'art_items/show.html.erb'
    end
  end
  private
  def get_params
     params.require(:shopping_cart_item).permit(:quantity)
  end
end
