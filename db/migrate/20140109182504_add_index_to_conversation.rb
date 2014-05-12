class AddIndexToConversation < ActiveRecord::Migration
  def change
    rename_column :messages, :conversation_id, :to_id
  end
end