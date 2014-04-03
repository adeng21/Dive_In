module Admin
  class DivesitesController <ApplicationController

    def new
      @divesite = Divesite.new
    end

    def create
      @divesite = Divesite.new(divesite_params)
      if @divesite.save
        redirect_to admin_homes_path,
        notice: "New Divesite Successfully Created!"
      else
        render new
      end
    end






    protected

    def divesite_params
      params.require(:divesite).permit(:name, :region, :country, :latitude, :longitude, :description, :surrounding_area, :rating, :water_temperature, :visibility)
    end

  end
end
