class DivesitesController < ApplicationController

  def index
    # if params[:category_id]
    #   category = Category.find_by(id: params[:category_id])
    #   @divesites = category.divesites
    # else
      @divesites = Divesite.all
    # end
  end

  def show
    @divesite = Divesite.find(params[:id])
    @divesite_images = @divesite.media.all
  end

  def search
    @search = Divesite.ransack(params[:q])
    @divesites = @search.result
  end
end


# form_tag divesites_path, method: :get do

# end
