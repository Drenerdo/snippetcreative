class Relationship < ActiveRecord::Base
  attr_accessible :followed_id, :follower_id
  
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  
  def notification
    self.follower.name + " followed you."
  end
  
  def n_user
    self.follower
  end
  
end
