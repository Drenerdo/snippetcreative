class ActivityObserver < ActiveRecord::Observer
  observe :snip, :relationship, :resume, :like
  
  def after_create(activity)
    
    if activity.class.to_s == "Relationship"
      uid = activity.follower.id
    else
      uid = activity.user.id
    end
    
    Activity.create!( 
      :user_id => uid,
      :activity_type => activity.class.to_s, 
      :activity_id => activity.id );
  end
  
  def after_destroy(activity)
    activity = Activity.find_by_activity_type_and_activity_id(activity.class.to_s, activity.id)
    if activity
      activity.destroy
    end
  end
  
end
