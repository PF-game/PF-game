class Public::ReviewCommentsController < ApplicationController

def create
  review = Review.find(params[:review_id])
  comment = current_customer.review_comments.new(review_comment_params)
  comment.review_id = review.id
  comment.save
  redirect_to request.referer
end

def show
  @review = Review.find(params[:id])
  @review_comment = ReviewComment.new
end

def destroy
  @review = Review.find(params[:review_id])
  ReviewComment.find(params[:id]).destroy
  redirect_to request.referer
end


private

def review_comment_params
   params.require(:review_comment).permit(:comment)
end

end
