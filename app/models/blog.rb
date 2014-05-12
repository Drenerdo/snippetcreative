class Blog < ActiveRecord::Base
  attr_accessible :content, :title, :user_id
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :content, presence: true, length: { minimum: 3, maximum: 10000 }
end
