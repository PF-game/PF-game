class Admin::ReviewCommentsController < ApplicationController

def create
  @review = Review.find(params[:review_id])
  comment = current_customer.review_comments.new(review_comment_params)
  comment.review_id = @review.id
  comment.save
end

def show
  @review = Review.find(params[:id])
  @review_comment = ReviewComment.new
end

def destroy
  ReviewComment.find(params[:id]).destroy
  @review = Review.find(params[:review_id])
end


private

def review_comment_params
  params.require(:review_comment).permit(:comment)
end

end
