class DivesitesController < ApplicationController


  def index
    if params[:q]
      @divesites = Divesite.search(params[:q])
      @divesites.includes([:categories, :months]) if @divesites
    else
      @divesites = Divesite.includes([:categories, :months])
    end
  end

  def show
    @divesite = Divesite.find(params[:id])
    @divesite_images = @divesite.media.all
  end

end

