class PictureFileName < ActiveRecord::Migration
  def change
  	add_column :users, :picture_file_name, :string
  end
end
