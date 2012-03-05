class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate(params[:name], params[:password])
      session[:user_id] = user.id
      session[:user_rights] = user.rights
      user.last_login = DateTime.now
      user.save
      
      if params[:password].length >= 6 && params[:password] =~ /\d/
        redirect_to admin_url
      else
        redirect_to change_pw_url, :alert => "Your password needs to be updated"
      end
    else
      redirect_to login_url, :alert => "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_rights] = nil
    redirect_to home_path, :notice => "Logged out"
  end

end

