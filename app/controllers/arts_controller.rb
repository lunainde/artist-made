class ArtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @arts = policy_scope(Art).order(created_at: :desc)
  end

  def show
    @art = Art.find(params[:id])
    authorize @art
  end

end
