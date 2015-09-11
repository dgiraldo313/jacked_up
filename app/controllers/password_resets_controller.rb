class PasswordResetsController < ApplicationController
	def new
	end

	def create
		puts "Hello, logs 1!"
		user= User.find_by(email: params[:email])
		if user
			puts "Hello, logs 2!"
			user.generate_password_reset_token!
			puts "Hello, logs 3!"
			Notifier.password_reset(user).deliver
			puts "Hello, logs 4!"
			flash[:success] = "Password reset instructions sent! Please check your email."
			redirect_to login_path
		else
			flash.now[:notice] = "Email not found."
			render action: 'new'
		end
	end

	def edit
		@user = User.find_by(password_reset_token: params[:id])
		if @user
		else
			render file 'public/404.html', status: :not_found
		end
	end

	def update
		@user= User.find_by(password_reset_token: params[:id])
		if @user && @user.update_attributes(user_params)
			@user.update_attribute(:password_reset_token, nil)
			redirect_to workouts_path
		else
			flash.now[:notice] = "Password reset token not found."
			render action: 'edit'
		end
	end

	private
	def user_params
		params.require(:user).permit(:password, :password_confirmation)
	end
end
