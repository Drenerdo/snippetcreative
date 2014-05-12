class SearchController < ApplicationController
  
  def search
    @users = User.search params[:q]
    #@jobs = Job.search params[:q]
  end
  
  def users
    @users = User.search params[:q]
  end
  
  def jobs
    #@jobs = Job.search params[:q]
  end
end