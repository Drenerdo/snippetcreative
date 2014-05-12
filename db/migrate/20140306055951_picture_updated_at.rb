class PictureUpdatedAt < ActiveRecord::Migration
  def change
  	add_column :users, :picture_updated_at, :string
  end
end
