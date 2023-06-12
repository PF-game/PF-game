class Public::CustomersController < ApplicationController
  
  def show
    @customer = Customer.find(params[:id])
    @reviews = @customer.reviews
  end
  
  def edit
  end
  
end
