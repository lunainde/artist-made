class ShoppingCartItemsController < ApplicationController

  def create
    create_update_init
    @shopping_cart_item = ShoppingCartItem.new(art_item: @art_item, shopping_cart: @shopping_cart, quantity: @quantity, price: @price)
    authorize @shopping_cart_item
    if @shopping_cart_item.save
      @shopping_cart.update(total: (@shopping_cart.total + @price))
      redirect_to shopping_cart_path(@shopping_cart),
      alert: "You have #{ @shopping_cart_item.quantity } x #{ @shopping_cart_item.art_item.art.title} - #{ @shopping_cart_item.art_item.format } in your shopping cart!"
    else
      render 'art_items/show.html.erb'
      # raise
    end
  end

  def create_one_item
    art = Art.find(params[:art_id])
    authorize art
    art_item = art.art_items.find_by(format: "digital")
    params[:art_item_id] = art_item.id
    params[:shopping_cart_item] = { quantity: "1" }
    create
  end

  def update
    create_update_init
    @shopping_cart_item = @shopping_cart.shopping_cart_items.find_by(art_item: @art_item)
    @shopping_cart_item.quantity += @quantity
    @shopping_cart_item.price += @price
    authorize @shopping_cart_item
    if @shopping_cart_item.save
      @shopping_cart.update(total: (@shopping_cart.total + @price))
      redirect_to shopping_cart_path(@shopping_cart),
      alert: "You have #{ @shopping_cart_item.quantity } x #{@shopping_cart_item.art_item.art.title} - #{ @shopping_cart_item.art_item.format } in your shopping cart!"
    else
      render 'art_items/show.html.erb'
    end
  end

  private
  def create_update_init
    @shopping_cart = current_user.shopping_carts.find_by(paid: false)
    @art_item = ArtItem.find(params[:art_item_id])
    @quantity = get_params[:quantity].to_i
    @price = @quantity * @art_item.price
  end

  def get_params
     params.require(:shopping_cart_item).permit(:quantity)
  end
end


