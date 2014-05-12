class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :snip_id
      t.integer :user_id
      t.text :comment

      t.timestamps
    end
    add_index :comments, :snip_id
    add_index :comments, :user_id
  end
end
