class CreateSnips < ActiveRecord::Migration
  def change
    create_table :snips do |t|
      t.integer :user_id
      t.string :name
      t.string :desc
      t.references :snip, :polymorphic => true
      t.timestamps
    end
    add_index :snips, :user_id
  end
end
