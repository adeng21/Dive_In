class DivesitesController < ApplicationController


  def index
    # if params[:category_id]
    #   category = Category.find_by(id: params[:category_id])
    #   @divesites = category.divesites
    # else
    # if params[:q]
    #   @divesites = Divesite.search(params[:q])
    # else
      @divesites = Divesite.all
    # end
  end

  def show
    @divesite = Divesite.find(params[:id])
    @divesite_images = @divesite.media.all
  end

  def search
    @divesites = Divesite.search(params[:q])
  end
end

