class SessionsController < ApplicationController
   # def new
  #   user = User.new
  #     if(user.save)
  #       session[:user_id] = user.id
  #        # Send them somewhere useful
  #     else
  #        # Handle the error
  #     end
  # end

  def create
  	user = User.find_by(email: params[:email])
  		if user && user.authenticate(params[:password])
  			session[:user_id] = user.id
  			redirect_to providers_url, :notice => "Logged in!"
  		else
  			flash.now[:alert] = "Invalid email or password"
      		render "new"
    	end
  end

  def destroy
  	session[:user_id] = nil
    redirect_to providers_url, notice: "Logged out!"
  end
  
end
