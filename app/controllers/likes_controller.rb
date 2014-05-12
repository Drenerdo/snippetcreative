class LikesController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @like = Like.find(params[:id])
    @notification = Notification.where(:user_id => current_user.id, :notify_id => params[:id], :notify_type => 'Like').first
    @notification.update_attributes(:read => true)
    redirect_to @like.snip
  end
end