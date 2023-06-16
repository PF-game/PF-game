class CreateReviewTags < ActiveRecord::Migration[6.1]
  def change
    create_table :review_tags do |t|
      t.references :review, null: false, foreign_key: true
      t.references :game_tag, null: false, foreign_key: true

      t.timestamps
    end
    # 同じタグは２回保存出来ない
    add_index :review_tags, [:review_tag_id,:game_tag_id],unique: true

  end
end
