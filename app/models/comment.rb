class Comment < ActiveRecord::Base
  attr_accessible :comment, :snip_id, :user_id
  belongs_to :snip
  belongs_to :user
  default_scope order: 'comments.created_at DESC'
  validates :comment, presence: true
  
  def notification
    self.user.name + " commented on " + self.snip.name + "."
  end
  
  def n_user
    self.user
  end
  
end
