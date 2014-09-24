class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text     "content"
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
