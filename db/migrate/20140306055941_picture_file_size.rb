class PictureFileSize < ActiveRecord::Migration
  def change
  	add_column :users, :picture_file_size, :string
  end
end
