class HomeController < ApplicationController

  def index
    @categories = Category.all
    @months = Month.all
    @divesites = Divesite.all

    respond_to do |format|
      format.html
      format.json {render json: {
      markers: Divesite.map_data
        }}
    end
  end

  def about
  end
end
