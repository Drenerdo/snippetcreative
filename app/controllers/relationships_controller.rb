class RelationshipsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user) unless current_user?(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
  
  def show
    @notification = Notification.where(:user_id => current_user.id, :notify_id => params[:id], :notify_type => 'Relationship').first
    @notification.update_attributes(:read => true)
    redirect_to followers_user_path(current_user)
  end
  
end