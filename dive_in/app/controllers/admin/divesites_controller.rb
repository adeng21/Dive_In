
module Admin
  class DivesitesController <ApplicationController

    before_action :authorize_user

    def new
      @divesite = Divesite.new
    end

    def create
      @divesite = Divesite.new(divesite_params)
      if @divesite.save
        create_join_table
        redirect_to admin_homes_path,
        notice: "New Divesite Successfully Created!"
      else
        render 'new'
      end
    end

    def index
      @divesites = Divesite.all
    end

    def show
      @divesite = Divesite.find(params[:id])
    end

    def edit
      @divesite = Divesite.find(params[:id])
    end

    def update
      @divesite = Divesite.find(params[:id])
      if @divesite.update(divesite_params)
        delete_join_table
        create_join_table
        redirect_to admin_divesite_path(@divesite),
        notice: "Divesite Successfully Updated!"
      else
        render 'edit'
      end
    end

    def destroy
      @divesite = Divesite.find(params[:id])
      @divesite.destroy
        redirect_to admin_divesites_path,
        notice: "Divesite Successfully Removed"
    end

    def destroy_multiple
      Divesite.where(id: params[:site_id]).destroy_all
        redirect_to admin_divesites_path,
        notice: "Divesite(s) Successfully Deleted"
    end


    protected

    def create_join_table
      params[:divesite][:month_ids].each do |month_id|
        unless month_id == ""
        month = Month.find(month_id)
        DivesiteMonth.create(divesite: @divesite, month: month)
        end
      end

      params[:divesite][:category_ids].each do |category_id|
        unless category_id == ""
        category = Category.find(category_id)
        DivesiteCategory.create(divesite: @divesite, category: category)
        end
      end
    end

    def delete_join_table
      DivesiteMonth.where(divesite: @divesite).destroy_all
      DivesiteCategory.where(divesite: @divesite).destroy_all
    end

    def divesite_params
      params.require(:divesite).permit(:name, :region, :country, :latitude, :longitude, :description, :surrounding_area, :rating, :water_temperature, :visibility, :image, :months => [], :categories => [])
    end
  end
end
