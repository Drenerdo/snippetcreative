class ApplicationsController < ApplicationController
  
  def index
    @applications = Application.first.user
  end
  
  def show
    @application = Application.find(params[:id])
  end
  
  def create
    @job = Job.find(params[:id])
    @job.applications.create!(user: current_user)
  end
  
end