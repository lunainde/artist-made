class ArtsController < ApplicationController

  def index
    @arts = Art.all
    @arts = policy_scope(Art).order(created_at: :desc)
  end
end
