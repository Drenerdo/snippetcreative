class MessagesToConversation < ActiveRecord::Migration
  def change
    rename_column :messages, :to_id, :conversation_id
  end
end