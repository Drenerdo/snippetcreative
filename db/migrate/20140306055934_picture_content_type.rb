class PictureContentType < ActiveRecord::Migration
  def change
  	add_column :users, :picture_content_type, :string
  end
end
