class OffersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :your_job, only: :create
  before_filter :other_user, only: :new
  
  def new
    @offer = @user.offers.build
    @jobs = current_user.jobs.paginate(page: params[:page], per_page: 9)
  end
  
  def create
    @user = User.find_by_username(params[:user_id])
    @offer = current_user.offers.build(:job_id => @job.id, :from_id => current_user.id, :to_id => @user.id)
    if @offer.save
      flash[:success] = "This offer has been sent!"
      redirect_to @user
    else
      redirect_to @job
    end
  end
  
  def show
    @notification = Notification.where(:user_id => current_user.id, :notify_id => params[:id], :notify_type => 'Offer').first
    @notification.update_attributes(:read => true)
    @offer = Offer.find(params[:id])
    @user = @offer.from
    @message = Message.new
  end
  
  private 
  
    def your_job
      @job = Job.find(params[:offer][:job_id])
      redirect_to(root_path) unless @job.user.id == current_user.id
    end
    
    def other_user
      @user = User.find_by_username(params[:user_id])
      redirect_to @user if current_user == @user
    end
  
end