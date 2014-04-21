class HomeController < ApplicationController


  def index
    @categories = Category.all
    @months = Month.all
    @divesites = Divesite.all

    respond_to do |format|
      format.html
      format.json {render json: {
      markers: [
        {latLng: [4.1147, 118.6288], name: 'Sipadan', id: 1},
        {latLng: [7.3722, 113.8417], name: 'Layang Layang', id: 2}
        ]}}
    end
  end
end
