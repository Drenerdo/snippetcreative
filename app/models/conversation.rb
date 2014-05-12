# class Conversation < ActiveRecord::Base
#   
#   attr_accessible :first_id, :second_id
#   has_many :messages
#   belongs_to :first, :class_name => 'User'
#   belongs_to :second, :class_name => 'User'
#   
#   scope :involving, lambda do |user|
#     joins(:messages)
#       .where("conversations.first_id = ?", user.id)
#       .where("conversations.second_id = ?", user.id)
#       .order("messages.created_at DESC")
#   end
#   
# end
