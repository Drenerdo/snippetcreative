class Video < ActiveRecord::Base
  has_one :snip, :as => :snip
  validates :snip, presence: true
  accepts_nested_attributes_for :snip
  attr_accessible :vimeo
  validates :vimeo, presence: true
  
  def canonical
    "video"
  end
  
end
