class UsersController < ApplicationController
  
  def new
    #get the role from params
    @role = params[:role]
    #set the role to user if role is not set
    @role = User::USER unless @role
    @user = User.new
    @user.role = @role 
  end
  
  
  def create
    @user = User.new(params[:user])
    if @user.save
     redirect_to new_session_path(:email=>@user.email)
    else
      render :new
    end
    
  end
  
  def activate
    
  end
  
end