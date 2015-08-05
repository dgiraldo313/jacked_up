class UsersController < ApplicationController
	def index
		@users= User.all
	end

	def show
		@user= User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])

	end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]= @user.id
      flash[:notice] = "Thank you for signing up"
      redirect_to workouts_path
    else
      # flash[:error] = "User could not be created"
      render action: :new
    end
  end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
    		flash[:success] = "Saved user."
    		redirect_to users_path
  	else
    		flash[:error] = "That user could not be saved."
    		render action: :edit
  	end
	end

	def destroy
		@user = User.find(params[:id])
		if @user.destroy
    		flash[:success] = "User was deleted."
  	else
    		flash[:error] = "User could not be deleted."
  	end
  	redirect_to users_path
  end


  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :username, :email,  :password, :password_confirmation)
	end
end
