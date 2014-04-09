class DivesitesController < ApplicationController

  def index
    @divesites = Divesite.all
  end

  def show
    @divesite = Divesite.find(params[:id])
  end
end
