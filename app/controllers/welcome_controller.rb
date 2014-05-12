class WelcomeController < ApplicationController
  
  def index
    if user_signed_in?
      @feed = current_user.feed.paginate(page: params[:page], per_page: 9)
    else
      @snips = Snip.where(:snip_type => "Image").paginate(page: params[:page], per_page: 9)
      render :layout => 'home'
    end
  end
end