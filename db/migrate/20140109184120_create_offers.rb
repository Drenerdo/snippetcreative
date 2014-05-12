class CreateOffers < ActiveRecord::Migration
  def change
  	create_table :offers do |t|
  		t.integer :to_id
  		t.integer :from_id
  		t.integer :job_id
  		t.timestamps :null => false
  	end
  	add_index "offers", ["from_id", "to_id", "job_id"], :name => "index_offers_on_from_id_and_to_id_and_job_id"
  end
end
