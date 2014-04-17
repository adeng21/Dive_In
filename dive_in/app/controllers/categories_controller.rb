class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @divesites = @category.divesites.order(rating: :asc).limit(10)
    #want to order by overall_rating but its not a attribute, but a method.
  end
end
