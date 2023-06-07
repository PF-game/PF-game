class CreateReviewComments < ActiveRecord::Migration[6.1]
  def change
    create_table :review_comments do |t|
      t.integer :customer_id, null: :false
      t.integer :game_id, null: :false
      t.text :comment, null: :false

      t.timestamps
    end
  end
end
