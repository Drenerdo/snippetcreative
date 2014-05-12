class UsersController < ApplicationController
  include SnipsHelper
  include ResumesHelper
  before_filter :authenticate_user!, only: [:edit, :update, :following, :followers]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :other_user, only: [:messages]

  def index
    @user = User.all 
  end
  
  def show
    @user = User.find_by_username(params[:id])
    if current_user?(@user)
      composer
      new_resume
    end
    @snips = @user.snips.paginate(page: params[:page], per_page: 10)
    @resumes = @user.resumes
  end

  def edit
    build_tag
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile Updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end
  
  def following
    @user = User.find_by_username(params[:id])
    @users = @user.followed_users.paginate(page: params[:page], per_page: 9)
    @title = 'Following'
    render 'relationships'
  end

  def followers
    @user = User.find_by_username(params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page: 9)
    @title = 'Followers'
    render 'relationships'
  end
    
  def resume
    @user = User.find_by_username(params[:id])
    @resumes = @user.resumes
    if current_user?(@user)
      new_resume
    end
  end
  
  def blog
    @user = User.find_by_username(params[:id])
    @blogs = @user.blogs.paginate(page: params[:page])
  end
  
  def snips
    @user = User.find_by_username(params[:id])
    if current_user?(@user)
      composer
    end
    @snips = @user.snips.paginate(page: params[:page], per_page: 9)
  end
  
  def messages
    @user = User.find_by_username(params[:id])
    @messages = Message.thread(@user, current_user)
    @messages.each do |m|
      m.update_attributes(:unread => false)
    end
    @message = Message.new
  end
  
  private

  def correct_user
    @user = User.find_by_username(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
    
  def build_tag 
    @tag = current_user.tags.build
  end
  
  def other_user
    @user = User.find_by_username(params[:id])
    redirect_to(root_path) if current_user?(@user)
  end
end