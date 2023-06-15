class Public::ReviewsController < ApplicationController
  # before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    if @review.save
      flash[:notice] = "投稿が成功しました"
      redirect_to reviews_path
    else
      @reviews = Review.all
      render :index
    end
  end

  def index
    @reviews = Review.all.page(params[:page])
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to reviews_path
  end

  def edit
    @review = Review.find(params[:id])
    if @review.customer = current_customer
      render :edit
    else
      redirect_to reviews_path
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "投稿が成功しました"
      redirect_to review_path(@review)
    else
      render :edit
    end
  end


  private

  def review_params
    params.require(:review).permit(:title, :body, :star)
  end

  # def is_matching_login_user
  #   review = Review.find(params[:id])
  #   unless review.id == current_customer.id
  #     redirect_to edit_review_path
  #   end
  # end

end
