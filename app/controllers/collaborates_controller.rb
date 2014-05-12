class CollaboratesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :your_job, only: :create
  before_filter :other_user, only: :new

  def new
    @collaborate = @user.collaborate.build
    @sessions = current_user.sessions.paginate(page: params[:page], per_page: 9)
  end

  def create
    @user = User.find_by_username(params[:user_id])
    @session = current_user.collaborates.build(:job_id => @collaborates.id, :from_id => current_user.id, :to_id => @user.id)
    if @collaborate.save
      flash[:success] = "Your collaboration request has just been sent!"
      redirect_to @user
    else
      redirect_to @sessions
    end
  end

  def show
    @notification = Notifications.where(:user_id => current_user.id, :notify_id => params[:id], :notify_type => 'Collaborate').first
    @notification.update_attributes(:read => true)
    @collaborate = Collaborate.find(params[:id])
    @user = @collaborate_from
    @message = Message.new
  end

  private

  def your_collaborate
    @collaborate = Collaborate.find(params[:collaborate][:session_id])
    redirect_to(root_path) unless @collaborate.user.id == current_user.id
  end

  def other_user
    @user = User.find_by_username(params[:user_id])
    redirect_to @user if current_user == @user
  end
end