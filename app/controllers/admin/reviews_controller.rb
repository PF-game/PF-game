class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @reviews = Review.all.page(params[:page])
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to admin_reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :star)
  end


end
