class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :name, :email, :password, :password_confirmation, :about, :location, :remember_me, :picture
  
  has_attached_file :picture,
    :styles => { :large => "512x512", :normal => "360x360", :small => "200x200", :tiny => "64x64", :thumbnail => "32x32" },
    :default_url => 'default_:style.png'

  validates_attachment_content_type :picture, :content_type => /\Aimage/
  
  has_many :snips, dependent: :destroy
  has_many :images
  has_many :videos
  
  has_many :resumes, dependent: :destroy
  has_many :employments
  has_many :notifications
  
  has_many :comments
  has_many :tags, :as => :taggable, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :offers, :foreign_key => :from_id, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :relationships, foreign_key: :follower_id, dependent: :destroy
  
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: :followed_id, class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  before_save { |user| user.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }
  validates :username, presence: true, length: { minimum: 5, maximum: 20 }, uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, on: :create, presence: true, length: { minimum: 6 }
  validates :password_confirmation, on: :create, presence: true

  #scope :search, -> (query) { ( where "name like ?" query) }
  #scope :search, ->(query) { where("name > ?", query) }

  def self.search(q)
    where("name LIKE ?", "%#{q}%")
  end

  def to_param
    username
  end
  
  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end
  
  def feed
    Activity.from_users_followed_by(self)
  end
  
  def received
    Message.where("to_id = '#{self.id}' AND unread = '1'")
  end
  
  def unread
    Message.where("to_id = '#{self.id}' AND unread = 1").count
  end
end