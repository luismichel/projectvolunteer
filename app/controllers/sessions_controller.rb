class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def login
	#Login Form
  end

  def login_attempt
	authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
	if authorized_user
		session[:user_id] = authorized_user.id
		flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
		redirect_to(:action => 'home')
	else
		flash[:notice] = "Invalid Username or Password"
		flash[:color]= "invalid"
		render "login"	
	end
  end

end