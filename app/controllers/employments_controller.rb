class EmploymentsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @employment = Employment.new(params[:employment])
    @resume = current_user.resumes.build(params[:resume])
    @employment.resume = @resume
    if @employment.save
      redirect_to current_user
    else
      render 'new'
    end
  end
  
  def edit
    @employment = Employment.find(params[:id])
    @resume = @employment.resume
  end
  
  def update
    @employment = Employment.find(params[:id])
    @resume = @employment.resume
    @employment.update_attributes(params[:employment])
    @resume.update_attributes(params[:resume])
    redirect_to resume_user_path(current_user)
  end
  
end