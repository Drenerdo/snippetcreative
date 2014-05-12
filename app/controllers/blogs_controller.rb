class BlogsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @blog = Blog.new
  end
  
  def create
    @blog = current_user.blogs.build(params[:blog])
    if @blog.save
      flash[:success] = "This blog has been created!"
      redirect_to @blog
    else
      render 'new'
    end
  end  
end