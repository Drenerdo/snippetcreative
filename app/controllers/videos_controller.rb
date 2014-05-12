class VideosController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @video = Video.new(params[:video])
    @snip = current_user.snips.build(params[:snip])
    @video.snip = @snip
    if @video.save
      redirect_to current_user
    else
      render 'new'
    end
  end
end