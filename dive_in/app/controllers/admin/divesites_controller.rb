
module Admin
  class DivesitesController <ApplicationController

    before_action :authorize_user

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

    def index
      @divesites = Divesite.all
    end

    def destroy_multiple
      Divesite.where(:id => params[:site_id]).destroy_all
      redirect_to admin_divesites_path,
      notice: "Divesite(s) Successfully Deleted"
    end


    protected

    def divesite_params
      params.require(:divesite).permit(:name, :region, :country, :latitude, :longitude, :description, :surrounding_area, :rating, :water_temperature, :visibility)
    end




  end
end
