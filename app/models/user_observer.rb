class UserObserver < ActiveRecord::Observer
  
  def after_create(user)
    
    
    
    
    
    UserMailer.admin_activation_email(user).deliver if (user.class.name == BusinessAdmin.name && !user.created_by.nil? && user.notify_on_create)
    
    UserMailer.staffer_activation_email(user).deliver if (user.class.name == Staffer.name && user.notify_on_create)
    
    
    UserMailer.activation_email(user).deliver if (user.class.name == User.name || (user.class.name == BusinessAdmin.name && user.created_by.nil?) )
    
    
    
    
    
  end
  
end
