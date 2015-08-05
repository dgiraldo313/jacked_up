class WorkoutsController < ApplicationController
  before_action :require_user
  before_action :set_workout, only: [:show, :edit, :update, :destroy]
  

	def index
		# @user= User.find(params[:user_id])
		@workouts= current_user.workouts
	end

	def show
    	# @workout = Workout.find(params[:id])
  	end

	def new
		@workout = current_user.workouts.new
	end

	def create
		# u = User.find_by_id(params[:user_id])
		# @user= User.find(params[:user_id])
      @workout= current_user.workouts.new(workout_params)

      if @workout.save
        flash[:success]= "Your workout was successfully created"
        redirect_to workouts_path
      else
        flash[:error]= "There was an error creating your workout"
        render action: :new
    	end
  	end

  def edit
  	# @workout = Workout.find(params[:id])

  end

def update
	@workout = Workout.find(params[:id])
	if @workout.update_attributes(workout_params)
  		flash[:success] = "Saved workout."
  		redirect_to workouts_path
	else
  		flash[:error] = "That workout could not be saved."
  		render action: :edit
	end
end

	def destroy
		@workout = Workout.find(params[:id])
		if @workout.destroy
    		flash[:success] = "Workout was deleted."
  	else
    		flash[:error] = "Workout could not be deleted."
  	end
  	redirect_to workouts_path
  end


    private

    def set_workout
      @workout = current_user.workouts.find(params[:id])
    end

    def workout_params
    	params.require(:workout).permit(:spades, :hearts, :clubs, :diamonds)
  	end

  	# def user
  	# 	@user= User.find(params[:user_id])
  	# end
end
