class UsersController < ApplicationController
  before_filter :require_user, except: [:new, :create]
  before_filter :load_user, only:[:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def show
    @providers = current_user.providers
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
	  	if @user.save
        session[:user_id] = @user.id
	  		redirect_to user_path(@user), notice: "Signed up!"
	  	else
	  		render 'new'
	  end
	end

  def edit
  	
  end

  def update
  		if @user.update_attributes(user_params)
  			redirect_to @user
  		else
  			render :edit
		end
  end

  def destroy
		@user.destroy
		redirect_to root_path, notice: "User account deleted!"
	end


  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end

  def load_user
    @user = User.find(params[:id])
  end
  
end
