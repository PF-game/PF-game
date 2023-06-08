class Public::ReviewsController < ApplicationController
  
  def new
    @review = Review.new
  end
  
end
