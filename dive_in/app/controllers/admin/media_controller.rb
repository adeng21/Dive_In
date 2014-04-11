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


    protected

    def media_params
      params.require(:medium).permit(:image)
    end
  end
end
