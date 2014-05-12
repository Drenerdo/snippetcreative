class AddDefaultToReadToNotification < ActiveRecord::Migration
  def change
    remove_column :notifications, :read
    add_column :notifications, :read, :boolean, :default => false
  end
end
