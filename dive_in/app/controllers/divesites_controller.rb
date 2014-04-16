class DivesitesController < ApplicationController


  def index
    # if params[:category_id]
    #   category = Category.find_by(id: params[:category_id])
    #   @divesites = category.divesites
    # else
      @search = Divesite.ransack(params[:q])
      @divesites = @search.result
      @search.build_condition



      # @divesites = Divesite.all

  end

  def show
    @divesite = Divesite.find(params[:id])
    @divesite_images = @divesite.media.all
  end



end


# form_tag divesites_path, method: :get do

# end
