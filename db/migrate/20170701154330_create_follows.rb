class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.integer :followed_id
      t.integer :follower_id
      t.timestamps
    end
    add_index :follows, :follower_id
    add_index :follows, :followed_id_
    add_index :follows, [:follower_id, :followed_id], unique: true
  end
end
