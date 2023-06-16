class Review < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  
  # タグのリレーションのみ記載
  has_many :review_tags, dependent: :destroy
  has_many :game_tags, through: :review_tags

  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: { maximum: 200 }

end
