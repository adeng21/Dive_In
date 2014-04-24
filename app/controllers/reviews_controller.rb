class ReviewsController < ApplicationController

  before_action :find_divesite, only: [:index, :new, :create]

  def index
    @reviews = @divesite.reviews
  end

  def new
    @review = Review.new
  end

  def create
    @review = @divesite.reviews.build(review_params)
    if @review.save
      redirect_to divesite_reviews_path(@divesite),
      notice: "Review Successfully Submitted!"
    else
      render new,
      notice: "Oops something went wrong. Please try again"
    end
  end

  protected

  def find_divesite
    @divesite = Divesite.find(params[:divesite_id])
  end

  def review_params
    params.require(:review).permit(:title, :body, :rating, :date, :user_id, :divesite_id)
  end
end
