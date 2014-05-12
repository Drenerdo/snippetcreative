class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.references :activity, :polymorphic => true
      t.timestamps
    end
  end
end
