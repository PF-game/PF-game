class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

def top
  @reviews = Review.all.page(params[:page]).order(created_at: :desc)
  @tag_list = GameTag.all
end

end
