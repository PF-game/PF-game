class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @reviews = @customer.reviews
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

end