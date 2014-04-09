class MonthsController < ApplicationController

  def show
    @month = Month.find(params[:id])
  end
end
