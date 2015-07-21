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

	def create 
		u= User.create(params.require(:user).permit(:name, :age))
		redirect_to users_path(u)
	end


  	def edit
  		@user = User.find(params[:id])

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
    	params[:user].permit(:name, :age)
  	end
end
