class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @reviews = Review.all.page(params[:page])
    @tag_list = GameTag.all
    
  end

  def show
    @review = Review.find(params[:id])
    @tag_list = @review.game_tags.pluck(:name).join(',')
    @review_tags = @review.game_tags
    @review_comment = ReviewComment.new
  end



  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to admin_reviews_path
  end

  def search_tag
    #検索結果画面でもタグ一覧表示
    @tag_list = GameTag.all.page(params[:page])
    #検索されたタグを受け取る
    @tag = GameTag.find(params[:game_tag_id])
    #検索されたタグに紐づく投稿を表示
    @reviews = @tag.reviews
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :star)
  end


end
