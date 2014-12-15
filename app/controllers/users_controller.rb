class UsersController < ApplicationController
  before_filter :require_user
  load_and_authorize_resource

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
	  	if @user.save
	  		render 'sessions/new', notice: "Signed up!"
	  	else
	  		render 'new'
	  end
	end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  		if @user.update_attributes(user_params)
  			redirect_to @user
  		else
  			render :edit
		end
  end

  	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to root_path, notice: "User account deleted!"
	end


  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end
  
end
