class Review < ApplicationRecord
  has_one_attached :image
  belongs_to :customer

  # タグのリレーションのみ記載
  has_many :review_tags, dependent: :destroy
  has_many :game_tags, through: :review_tags

  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: { maximum: 200 }


  def save_game_tags(tags)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.game_tags.pluck(:name) unless self.game_tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    # old_tags = current_tags - tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = tags - current_tags

    # # 古いタグを消す
    # old_tags.each do |old_name|
    #   self.game_tags.delete GameTag.find_by(name:old_name)
    # end

    # 新しいタグを保存
    new_tags.each do |new_name|
      game_tag = GameTag.find_or_create_by(name:new_name)
      self.game_tags << game_tag
    end
  end

end
