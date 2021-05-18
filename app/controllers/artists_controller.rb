class ArtistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @artists = Artist.all
    @artists = policy_scope(Artist).order(created_at: :desc)
  end

  def show
    @artist = Artist.find(params[:id])
    authorize @artist
  end
end

