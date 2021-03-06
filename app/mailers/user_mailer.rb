class UserMailer < ActionMailer::Base  
  
  default :from => WebApplication::config['mail_notifications']['default_mail_from']
  
  def activation_email(user)
    @user = user
    @url = activate_user_url(:activation_key=>user.activation_key)
    mail(:to=>user.email, :subject=>I18n.t("mailer.user.activation.subject") )
  end
  
  def reset_password_mail(user)
    
    @user = user
    
    @url = create_new_password_url(:reset_password_key=>user.reset_password_key)
    mail(:to=>user.email, :subject=>I18n.t("mailer.user.reset_password.subject") )
  end
  
  def admin_activation_email(admin)
    raise RuntimeError if admin.class.name != BusinessAdmin.name
    @admin = admin
    @url = activate_user_url(:activation_key=>admin.activation_key)
    mail(:to=>admin.email, :subject=>I18n.t("mailer.admin.activation.subject") )
  end
  
  def staffer_activation_email(user)
    raise RuntimeError if user.class.name != Staffer.name
    @user = user
    @url = activate_user_url(:activation_key=>user.activation_key)
    mail(:to=>user.email, :subject=>I18n.t("mailer.staffer.activation.subject") )
  end
end
