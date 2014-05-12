class CreateTags < ActiveRecord::Migration
  def change
  	create_table :tags do |t|
  		t.integer :taggable_id
  		t.string :taggable_type
  		t.string :tag
  		t.timestamps :null => false
  	end
  end
end