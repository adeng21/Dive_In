class MonthsController < ApplicationController

  def show
    @month = Month.find(params[:id])
    @divesites = @month.divesites.sort_by(&:overall_rating).reverse
  end
end
