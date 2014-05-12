class Snip < ActiveRecord::Base
  attr_accessible :user_id, :name, :desc
  belongs_to :snip, :polymorphic => true
  belongs_to :user
  has_many :likes
  has_many :comments
  validates :user_id, presence: true
  validates :name, presence: true
  default_scope :order => "id DESC"
  
end
