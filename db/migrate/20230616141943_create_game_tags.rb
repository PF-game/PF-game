class CreateGameTags < ActiveRecord::Migration[6.1]
  def change
    create_table :game_tags do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :game_tags, :name, unique:true
  end
end
