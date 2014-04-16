class HomeController < ApplicationController


  def index
    @categories = Category.all
    @months = Month.all
    @divesites = Divesite.all
    @hash = Gmaps4rails.build_markers(@divesites) do |divesite, marker|
      marker.lat divesite.latitude
      marker.lng divesite.longitude
      marker.infowindow divesite.name
      marker.json({id: divesite.id})
    end
  end

end
