class Admin::HomesController < ApplicationController

def top
  @reviews = Review.all.page(params[:page])
end

end
