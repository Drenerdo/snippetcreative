class TagsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @taggable = find_taggable
    @tag = @taggable.tags.build(params[:tag])
    @tag.save
    respond_to do |format|
      format.html { redirect_to edit_user_path(current_user) }
      format.js
    end
  end

  def show
    @tag = Tag.find(params[:id])
    @users = User.search :conditions => { :taggable => @tag.tag }
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to current_user }
      format.js
    end
  end

  private

  def find_taggable
    param.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
  end
end