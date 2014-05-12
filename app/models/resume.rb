class Resume < ActiveRecord::Base
  belongs_to :resume, :polymorphic => true
  attr_accessible :time_end, :time_start, :user_id, :present
  validates :time_start, presence: true
  
  validates_presence_of :time_end, :if => lambda{ |m| m.present }
  validate :date_is_valid
  belongs_to :user
  
  default_scope :order => "time_start DESC"
  
  private 
    def date_is_valid
      errors.add(:time_start, 'must be earlier than the end.') if self.time_start > self.time_end
    end
end
