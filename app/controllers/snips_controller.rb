class SnipsController < ApplicationController
  before_filter :authenticate_user!
  include SnipsHelper
  
  def update
    @snip = Snip.find(params[:id])
    @snip.update_attributes(params[:snip])
  end

  def destroy
    @snip = Snip.find(params[:id])
    @snip.destroy
    respond_to do |format|
      format.html { redirect_to current_user }
      format.js
    end
  end
  
  def show
    @snip = Snip.find(params[:id])
    @snip.comments.each do |comment|
      @notification = Notification.where(:user_id => current_user.id, :notify_id => comment.id, :notify_type => 'Comment').first
      @notification.update_attributes(:read => true) if @notification
    end
  end
  
  def like 
    @snip = Snip.find(params[:id])
    @like = @snip.likes.build(:user_id => current_user.id)
    respond_to do |format|
      format.html { redirect_to @snip } if @like.save
      format.js if @like.save
    end
  end
  
  def unlike
    @snip = Snip.find(params[:id])
    @like = @snip.likes.find_by_user_id(current_user.id)
    @like.destroy
    respond_to do |format|
      format.html { redirect_to @snip }
      format.js
    end
  end
end