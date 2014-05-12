class CommentsController < ApplicationController
  
  def create
    @snip = Snip.find(params[:snip_id])
    @comment = current_user.comments.create!(:comment => params[:comment][:comment], :snip_id => @snip.id)
    respond_to do |f|
      f.html {redirect_to @snip}
      f.js 
    end
    
  end
  
  def show
    @comment = Comment.find(params[:id])
    redirect_to snip_path(@comment.snip)
  end
end