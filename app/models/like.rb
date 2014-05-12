class Like < ActiveRecord::Base
  attr_accessible :snip_id, :user_id
  belongs_to :snip
  belongs_to :user
  validates :user_id, presence: true
  validates :snip_id, presence: true
  validates_uniqueness_of :snip_id, :scope => :user_id
  
  def notification
    self.user.name + " liked " + self.snip.name + "."
  end
  
  def n_user
    self.user
  end
  
end
