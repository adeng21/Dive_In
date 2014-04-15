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
    # @divesites = Divesite.find_by(divesite_params)
  end



  protected

  def divesite_params
    params.require(:divesite).permit(:name, :country, :latitude, :longitude, :month_ids => [], :category_ids => [])
  end

end


# form_tag divesites_path, method: :get do

# end
