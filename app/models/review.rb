class Review < ApplicationRecord
  has_one_attached :image
  belongs_to :customer

  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: { maximum: 200 }

end
