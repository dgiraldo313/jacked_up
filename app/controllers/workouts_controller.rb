class WorkoutsController < ApplicationController

	def index
		# @user= User.find(params[:user_id])
		@workouts= user.workouts.all
	end

	def show
    	@workout = Workout.find(params[:id])
  	end

  	def new
  		@workout = Workout.new
  	end

	def create
		# u = User.find_by_id(params[:user_id])
		# @user= User.find(params[:user_id])
    	user.workouts.create(params.require(:workout).permit(:spades, :hearts, :clubs, :diamonds))
    	redirect_to user_workouts_path
  	end

  def edit
  	@workout = Workout.find(params[:id])

  end

def update
	@workout = Workout.find(params[:id])
	if @workout.update_attributes(workout_params)
  		flash[:success] = "Saved workout."
  		redirect_to user_workouts_path
	else
  		flash[:error] = "That workout could not be saved."
  		render action: :edit
	end
end

	def destroy
		@workout = Workout.find(params[:id])
		if @workout.destroy
    		flash[:success] = "Todo list item was deleted."
  	else
    		flash[:error] = "Todo list item could not be deleted."
  	end
  	redirect_to user_workouts_path
  end


    private
    def workout_params
    	params[:workout].permit(:spades, :hearts, :clubs, :diamonds)
  	end

  	def user
  		@user= User.find(params[:user_id])
  	end
end
