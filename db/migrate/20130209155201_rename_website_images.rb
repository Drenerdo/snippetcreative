class RenameWebsiteImages < ActiveRecord::Migration
  def change
    remove_attachment :websites, :preview
    add_attachment :websites, :image
  end
end
