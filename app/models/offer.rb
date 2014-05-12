class Offer < ActiveRecord::Base
  attr_accessible :from_id, :job_id, :to_id
  belongs_to :from, :class_name => "User"
  belongs_to :to, :class_name => "User"
  belongs_to :job
  validates :from_id, presence: true
  validates :job_id, presence: true
  validates_uniqueness_of :job_id, :scope => :to_id
  
  def notification
    self.from.name + " offered you a " + self.job.position + " position."
  end
  
  def n_user
    self.from
  end
  
end
