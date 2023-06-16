class ReviewTag < ApplicationRecord
  belongs_to :review
  belongs_to :game_tag
end
