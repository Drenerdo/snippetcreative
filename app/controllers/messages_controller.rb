class MessagesController < ApplicationController
  before_filter :authenticate_user!, except: :show
  before_filter :other_user, only: [:new, :create]
  
  def new
    @message = Message.new
  end
  
  def create
    params[:message][:to_id] = @user.id
    @message = current_user.messages.build(params[:message])
    @message.save
    respond_to do |f|
      f.html { redirect_to user_messages_path(@user) }
      f.js
    end
    
  end
  
  def show
    @message = Message.find_by_username(params[:id])
    @from = @message.user
    @to = @message.to
    redirect_to(root_path) unless current_user?(@from) || current_user?(@to)
  end
  
  def index
    @messages = Message.threads(current_user)
  end
  
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    respond_to do |format|
      format.html { redirect_to current_user }
      format.js
    end
  end
  
  private 
  
  def other_user
    @user = User.find_by_username(params[:user_id])
    redirect_to(root_path) if current_user?(@user)
  end
end