class SessionsController < ApplicationController

	def new
	end

	#checks if email and password are in database
	def create
	  @user = User.find_by_email(params[:session][:email])
	  if @user && @user.authenticate(params[:session][:password])
	    session[:user_id] = @user.id
	    redirect_to '/'
	  else
	    redirect_to '/login'
	  end 
	end

	#deletes session; logout
	def destroy 
	  session[:user_id] = nil 
	  redirect_to '/' 
	end   

end
