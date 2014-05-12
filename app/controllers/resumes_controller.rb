class ResumesController < ApplicationController
  before_filter :authenticate_user!
  include ResumesHelper

  def new
    new_resume
  end
  
  def index
    
  end
  
  def create
    @resume = current_user.resumes.build(params[:resume])
    if @resume.save
      flash[:success] = "Job added to resume!"
      redirect_to [:resume, current_user]
    else
      render 'new'
    end
  end

  def destroy
  end
end