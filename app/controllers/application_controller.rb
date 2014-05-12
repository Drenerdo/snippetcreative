class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  	def after_sign_in_path_for(user)
      if user.is_a?(User)
       current_user
      else
       super
      end
   	end
    
    def after_sign_out_path_for(user)
      if user.is_a?(User)
        current_user
        else
        super
      end
    end

    def after_sign_up_path_for(user)
      if user.is_a?(User)
       edit_page_path(:id => current_user.id, :new_user => 1)
      else
       super
      end
    end

    def after_edit_path_for(user)
      if user.is_a?(User)
        current_user
      else
        super
      end
    end

  def current_user?(user)
    if user_signed_in?
      user.id == current_user.id
    else 
      return false
    end
  end
end