class CreateEmployments < ActiveRecord::Migration
  def change
  	create_table :employments do |t|
  		t.string :employer
  		t.string :position
  		t.string :desc
  		t.timestamp :null => false
  	end
  end
end