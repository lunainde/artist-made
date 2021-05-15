class ArtsController < ApplicationController

  def index
    @arts = Art.all
    @arts = policy_scope(Art).order(created_at: :desc)
  end

  def show
    @art = Art.find(params[:id])
    authorize @art
  end

end
