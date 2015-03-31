class SessionsController < ApplicationController
<<<<<<< HEAD
	skip_before_filter :authorize
=======
	#skip_before_filter :authorize
>>>>>>> 131bf370a275e678ae15650b184fcdf0c7788949

  def new
  end

  def create
  	user = User.find_by_name(params[:name]) 
	if user and user.authenticate(params[:password]) 
		session[:user_id] = user.id 
		redirect_to admin_url 
	else 
		redirect_to login_url, alert: "Invalid user/password combination" 
	end 
  end

  def destroy
  	session[:user_id] = nil 
	redirect_to store_url, notice: "Logged out"
  end
end
