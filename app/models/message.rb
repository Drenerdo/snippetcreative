class Message < ActiveRecord::Base
  attr_accessible :message, :reply_to, :to_id, :user_id, :unread
  validates :user_id, presence: true
  validates :to_id, presence: true
  validates :message, presence: true
  belongs_to :user
  belongs_to :to, class_name: "User"
  
  def self.threads(user)
    where("user_id = '#{user.id}' OR to_id = '#{user.id}'").group("user_id").order('date(created_at) DESC')
  end
  
  def self.thread(user1, user2)
    where("( user_id = #{user1.id} AND to_id = #{user2.id} ) or ( user_id = #{user2.id} AND to_id = #{user1.id} )").order('created_at DESC')
  end
  
end
