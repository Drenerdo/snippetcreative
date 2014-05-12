class WebsitesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user, only: [:edit, :update]
  
  def create
    @website = Website.new(params[:website])
    @snip = current_user.snips.build(params[:snip])
    @website.snip = @snip
    if @website.save
      redirect_to current_user
    else
      render 'new'
    end
  end
  
  def edit
    @snip = @website.snip
  end

  def update
    @website.update_attributes(params[:website])
    @website.snip.update_attributes(params[:snip])
    redirect_to @website.snip
  end
   
  private
   
  def correct_user
    @website = Website.find(params[:id])
    redirect_to(root_path) unless current_user?(@website.snip.user)
  end
  
end