class Website < ActiveRecord::Base
  has_one :snip, :as => :snip
  validates :snip, presence: true
  accepts_nested_attributes_for :snip
  attr_accessible :url, :image
  has_attached_file :image, :styles => { :thumb => "460x306#", :large => "1030x772#" }
  validates :url, presence: true
  validates_attachment_content_type :image, :content_type => /image/
  before_save :sanitize_url
  
  def canonical
    "website"
  end
  
  private

  def sanitize_url
    self.url = "http://#{url}" unless url =~ /^https?:\/\//
  end
end