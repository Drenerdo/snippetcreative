class Tag < ActiveRecord::Base
  attr_accessible :tag, :taggable_type
  belongs_to :taggable, :polymorphic => true
  validates :tag, presence: true, length: { maximum: 140 }
  validates_uniqueness_of :tag, :scope => [ :taggable_id, :taggable_type ]
  default_scope order: 'tags.created_at DESC'
end