class ChangePosts < ActiveRecord::Migration
  def change
    remove_column :posts, :content
    add_column :posts, :title, :text
    add_column :posts, :body, :text

  end
end
