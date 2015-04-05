class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :body
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
