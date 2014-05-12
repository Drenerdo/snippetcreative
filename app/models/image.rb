class Image < ActiveRecord::Base
  has_one :snip, :as => :snip
  validates :snip, presence: true
  accepts_nested_attributes_for :snip
  attr_accessible :image
  has_attached_file :image, :styles => { :thumb => "512x512", :large => "1030x1030#" }
  validates :image, :attachment_presence => true
  validates_attachment_content_type :image, :content_type => /image/
  
  def canonical
    "picture"
  end
end