class CreateMessages < ActiveRecord::Migration
  def change
  	create_table :messages do |t|
  		t.integer :user_id
  		t.integer :to_id
  		t.integer :reply_to
  		t.text :messages
  		t.boolean :unread, :default => true
  		t.timestamps :null => false
  	end
  	add_index "messages", ["user_id"], :name => "index_messages_on_user_id"
  end
end
