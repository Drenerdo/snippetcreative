class CreateRelationships < ActiveRecord::Migration
  def change
  	create_table :relationships do |t|
  		t.integer :follower_id
  		t.integer :followed_id
  		t.timestamp :null => false
  	end
  	add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  	add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  	add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"
  end
end