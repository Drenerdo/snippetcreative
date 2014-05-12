class CreateResumes < ActiveRecord::Migration
  def change
  	create_table :resumes do |t|
  		t.integer :resume_id
  		t.integer :user_id
  		t.string :resume_type
  		t.boolean :present
  		t.datetime :time_start
  		t.datetime :time_end
  		t.timestamps :null => false
  	end
  	add_index "resumes", ["user_id"], :name => "index_resumes_on_user_id"
  end
end