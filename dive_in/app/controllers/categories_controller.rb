class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @divesites = @category.divesites.all.sort_by(&:overall_rating).reverse
  end
end
