class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customers_params)
      redirect_to admin_customers_path(@customer)
    else
      render :show
    end
  end


  private

  def customers_params
    params.require(:customer).permit(:name, :email, :password, :is_deleted)
  end

end
