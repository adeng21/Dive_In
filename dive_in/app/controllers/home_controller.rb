class HomeController < ApplicationController

  def index
    @categories = Category.all
    @months = Month.all
  end

end
