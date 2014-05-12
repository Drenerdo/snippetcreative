class NotificationObserver < ActiveRecord::Observer
  observe :offer, :comment, :like, :relationship, :application
  
  def after_create(activity)
    
    if activity.class.to_s == "Message" || activity.class.to_s == "Offer"
      uid = activity.to_id
    elsif activity.class.to_s == "Comment"
      uid = activity.snip.user.id
    elsif activity.class.to_s == "Like"
      uid = activity.snip.user.id
    elsif activity.class.to_s == "Relationship"
      uid = activity.followed_id
    elsif activity.class.to_s == "Application"
      uid = activity.job.user_id
    end
    
    if activity.class.to_s == "Comment" && uid == activity.user.id
      return false
    end
    
    if activity.class.to_s == "Like" && uid == activity.user.id
      return false
    end
    
    Notification.create!( 
      :user_id => uid,
      :notify_type => activity.class.to_s, 
      :notify_id => activity.id );
  end
  
end
