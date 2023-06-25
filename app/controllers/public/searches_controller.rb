class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @range = params[:range]

    if @range == "ユーザー"
      @customers = Customer.looks(params[:search], params[:word])
    else
      @reviews = Review.looks(params[:search], params[:word])
    end
  end


end
