class Public::CustomersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def show
    @customer = Customer.find(params[:id])
    @reviews = @customer.reviews.page(params[:page])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
  end


  private

  def customer_params
    params.require(:customer).permit(:name, :introduction, :profile_image)
  end

  def is_matching_login_user
    customer = Customer.find(params[:id])
    unless customer.id == current_customer.id
      redirect_to reviews_path
    end
  end


end
