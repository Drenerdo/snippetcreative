class Notification < ActiveRecord::Base
  
  default_scope order('created_at DESC')
  attr_accessible :user_id, :notify_type, :notify_id, :read
  belongs_to :notify, :polymorphic => true
  belongs_to :user
  
end
