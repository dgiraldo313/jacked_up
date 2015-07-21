class HistoryController < ApplicationController

	def index
		# @user= User.find(params[:user_id])
		@histories= user.histories.all
	end

	def show
    	@history = History.find(params[:id])
  	end

  	def new
  		@history = History.new
  	end

	def create
		# u = User.find_by_id(params[:user_id])
		# @user= User.find(params[:user_id])
    	user.histories.create(params.require(:history).permit(:spades, :hearts, :clubs, :diamonds))
    	redirect_to user_history_index_path
  	end

  def edit
  	@history = History.find(params[:id])

  end

def update
	@history = History.find(params[:id])
	if @history.update_attributes(history_params)
  		flash[:success] = "Saved history."
  		redirect_to user_history_path
	else
  		flash[:error] = "That history could not be saved."
  		render action: :edit
	end
end

	def destroy
		@history = History.find(params[:id])
		if @history.destroy
    		flash[:success] = "History was deleted."
  	else
    		flash[:error] = "History could not be deleted."
  	end
  	redirect_to user_history_index_path
  end


    private
    def history_params
    	params[:history].permit(:user_id, :updated_at)
  	end

  	def user
  		@user= User.find(params[:user_id])
  	end
end
