class Employment < ActiveRecord::Base
  has_one :resume, :as => :resume
  validates :resume, presence: true
  accepts_nested_attributes_for :resume
  attr_accessible :desc, :employer, :position, :snip
  validates :employer, presence: true
  validates :position, presence: true
  validates :desc, presence: true
  
  def canonical
    "job"
  end
  
end
