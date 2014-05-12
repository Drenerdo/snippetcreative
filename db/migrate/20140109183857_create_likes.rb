class CreateLikes < ActiveRecord::Migration
  def change
  	create_table :likes do |t|
  		t.integer :user_id
  		t.integer :snip_id
  		t.timestamps :null => false
  	end
  	add_index "likes", ["snip_id"], :name => "index_likes_on_snip_id"
  	add_index "likes", ["user_id"], :name => "index_likes_on_user_id"
  end
end