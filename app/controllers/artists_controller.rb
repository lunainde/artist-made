class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
    @artists = policy_scope(Artist).order(created_at: :desc)
  end

  def show
    @artist = Artist.find(params[:id])
    authorize @artist
    # @art = Art.find(params[:art_id])
  end

 # def artist_params
 #    params.require(:artist).permit(:first_name, :last_name, :art_type, :url_artists_photo)
 #    authorize @artist
 #  end
end

