class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit
 # Pundit: white-list approach.
  after_action :verify_authorized, except: [:index, :paid_shopping_carts, :all_favorites], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: [:index, :paid_shopping_carts, :all_favorites], unless: :skip_pundit?

 # Uncomment when you *really understand* Pundit!
 # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
 # def user_not_authorized
 #   flash[:alert] = "You are not authorized to perform this action."
 #   redirect_to(root_path)
 # end
#  before_action :find_shopping_cart
#  @users_shopping_cart = ShoppingCart.where(user: current_user).find_by(paid: false) if current_user

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
  



 private

  # def find_shopping_cart
  #   if current_user
  #     @users_shopping_cart = ShoppingCart.where(user: current_user).find_by(paid: false)
  #   end
  # end

 def skip_pundit?
   devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
 end
end
