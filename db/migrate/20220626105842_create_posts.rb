class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :user_id
      t.integer :post_comment_id
      t.integer :good_id
      t.string :title
      t.text :body
      t.boolean :active_status

      t.timestamps
    end
  end
end
