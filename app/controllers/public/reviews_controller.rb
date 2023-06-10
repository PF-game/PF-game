class Public::ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review = customer_id = current_customer.id
    @review.save
    redirect_to public_reviews_path
  end

  def index
  end

  def show
  end


  private

  def review_params
    params.require(:review).permit(:title, :body)
  end

end
