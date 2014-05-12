class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :first_id
      t.integer :second_id

      t.timestamps
    end
  end
end
