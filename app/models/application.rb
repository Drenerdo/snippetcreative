class Application < ActiveRecord::Base
  belongs_to :job
  belongs_to :user
  attr_accessible :user
  validates_uniqueness_of :user_id, :scope => :job_id
  
  def notification
    self.user.name + " applied for your " + self.job.position + " position."
  end
  
end
