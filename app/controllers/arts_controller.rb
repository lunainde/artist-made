class ArtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params[:button] == "searched" && params[:search][:search_value].present?
      @arts = policy_scope(Art).global_search(params[:search][:search_value])
      # raise
    elsif params[:art_type]
      @arts = policy_scope(Art).where(category: params[:art_type])
      # raise
    elsif params[:art_format]
      @arts = policy_scope(Art).where(art_format: params[:art_format])
    elsif params[:theme]
      @arts = policy_scope(Art).where(art_theme: params[:theme])
    elsif params[:start_price] && params[:end_price]
      art_items = policy_scope(ArtItem).where(format: "digital").where(price: (params[:start_price]..params[:end_price])).order(:price)
      @arts = art_items.map do |art_item|
        art_item.art
      end
    else
      @arts = policy_scope(Art).order(created_at: :desc)
    end
  end

  def favor
    @art = Art.find(params[:art_id])
    authorize @art
    if current_user.favorited?(@art)
      current_user.unfavorite(@art)
    else
      current_user.favorite(@art)
    end
      # puts(current_user.all_favorites[1])
  end
  def all_favorites
    art_ids = current_user.all_favorites.map do |favorite|
      favorite.favoritable_id
    end
    @arts = policy_scope(Art).find(art_ids)
  end

  def show
    @art = Art.find(params[:id])
    @art_item = ArtItem.where(art_id: @art.id)
    @shirt = ArtItem.where(art_id: @art.id, format: "t-shirt")[0].id
    @hoodie = ArtItem.where(art_id: @art.id, format: "hoodie")[0].id
    @bag = ArtItem.where(art_id: @art.id, format: "bag")[0].id
    @postcard = ArtItem.where(art_id: @art.id, format: "postcards")[0].id
    @poster = ArtItem.where(art_id: @art.id, format: "posters")[0].id
    @cellphone = ArtItem.where(art_id: @art.id, format: "cellphones")[0].id
    @tablet = ArtItem.where(art_id: @art.id, format: "tablets")[0].id
    authorize @art

    @digital_art_item = @art.art_items.find_by(format: "digital")
    @shopping_cart_item = ShoppingCartItem.new
  end
end
