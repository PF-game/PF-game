class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :customer_id, null: :false
      t.string :title, null: :false
      t.text :body, null: :false
      t.string :star, null: :false
      

      t.timestamps
    end
  end
end
