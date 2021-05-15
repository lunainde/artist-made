class ArtItemsController < ApplicationController
  def index
    @art_items = ArtItem.all
    @art_items = policy_scope(ArtItem).order(created_at: :desc)
  end
end
