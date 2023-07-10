class Public::ReviewsController < ApplicationController
  # before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
     # 受け取った値を,で区切って配列にする
    tag_list = params[:review][:name].split(',')
    if @review.save
      @review.save_game_tags(tag_list)
      flash[:notice] = "投稿が成功しました"
      redirect_to review_path(@review)
    else
      @reviews = Review.all
      render :new
    end
  end

  def index
    @reviews = Review.all.page(params[:page]).order(created_at: :desc)
    @tag_list = GameTag.all
  end

  def show
    @review = Review.find(params[:id])
    @tag_list = @review.game_tags.pluck(:name).join(',')
    @review_tags = @review.game_tags
    @review_comment = ReviewComment.new
    # @customer = Customer.find(params[:id])
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to reviews_path
  end

  def edit
    @review = Review.find(params[:id])
    @tag_list = @review.game_tags.pluck(:name).join(',')
    if @review.customer == current_customer
      render :edit
    else
      redirect_to reviews_path
    end
  end

  def update
    @review = Review.find(params[:id])
    tag_list = params[:review][:name].split(',')
    if @review.update(review_params)
      @review.save_game_tags(tag_list)
      flash[:notice] = "投稿が成功しました"
      redirect_to review_path(@review)
    else
      render :edit
    end
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
