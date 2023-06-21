class Public::HomesController < ApplicationController

def top
  @reviews = Review.all.limit(4)
end

def about
end


end
