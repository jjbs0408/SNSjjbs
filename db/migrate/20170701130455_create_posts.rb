class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :content
      t.belongs_to :user
      # t.integer :user_id
      t.timestamps
    end

  end
  # add_index :posts, :user_id
end
