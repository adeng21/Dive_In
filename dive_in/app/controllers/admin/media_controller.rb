module Admin
  class MediaController < ApplicationController

    def create
      @divesite = Divesite.find(params[:divesite_id])
      @medium = @divesite.media.build(media_params)

      if @medium.save
        redirect_to admin_divesite_path(@divesite),
        notice: "Image Successfully Added!!"
      else
        render 'admin/divesites/show'
      end
    end

    def destroy
      @divesite = Divesite.find(params[:divesite_id])
      @medium = @divesite.media.find(params[:id])
      @medium.destroy
        redirect_to admin_divesite_path(@divesite),
        notice: "Image Successfully Removed!"
    end


    protected

    def media_params

      params.require(:medium).permit(:image, :id)
    end
  end
end
