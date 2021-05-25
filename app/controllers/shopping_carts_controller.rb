class ShoppingCartsController < ApplicationController

  def show
    @shopping_cart = ShoppingCart.find(params[:id])
    authorize @shopping_cart
    if @shopping_cart.paid
      redirect_to paid_shopping_carts_path
    else
      create_stripe_session if @shopping_cart.shopping_cart_items.first
    end
  end
  def paid_shopping_carts
    @paid_shopping_carts = policy_scope(ShoppingCart).where(paid: true)
  end
  private
  def create_stripe_session
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
      name: "Order #{@shopping_cart.id}",
      images: [@shopping_cart.shopping_cart_items.first.art_item.art.img_url],
      amount: (@shopping_cart.total * 100).to_i,
      currency: 'eur',
      quantity: 1
      }],
      success_url: shopping_cart_url(@shopping_cart),
      cancel_url: shopping_cart_url(@shopping_cart)
  )
  @shopping_cart.update(checkout_session_id: session.id)
  # redirect_to new_order_payment_path(order)
  end

end

