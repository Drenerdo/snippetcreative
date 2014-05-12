class ImagesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user, only: [:edit, :update]

  # Project tags are going to need to be added for project DNA feature
  
  def create
    @image = Image.new(params[:image])
    @snip = current_user.snips.build(params[:snip])
    @image.snip = @snip
    if @image.save
      redirect_to current_user
    else
      render 'new'
    end
  end
  
  def edit
    @snip = @image.snip
  end
  
  def update
    @image.update_attributes(params[:image])
    @image.snip.update_attributes(params[:snip])
    redirect_to @image.snip
  end
  
  private
  
  def correct_user
    @image = Image.find(params[:id])
    redirect_to(root_path) unless current_user?(@image.snip.user)
  end
end