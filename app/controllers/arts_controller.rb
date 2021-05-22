class ArtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @arts = policy_scope(Art).order(created_at: :desc)
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
  end
end
