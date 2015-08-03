class HistoryController < ApplicationController
  before_action :require_user
  before_action :set_history, only: [:show, :edit, :update, :destroy]

	def index
		# @current_user= current_user.find(params[:current_user_id])
		@histories= current_user.histories
	end

	def show
    	# @history = History.find(params[:id])
  	end

  	def new
  		@history = current_user.histories.new
  	end

	def create
		# u = current_user.find_by_id(params[:current_user_id])
		# @current_user= current_user.find(params[:current_user_id])
    	@history= current_user.histories.new(history_params)

      if @history.save
        flash[:success]= "Your history was successfully created"
        render action: :show
      else
        flash[:error]= "There was an error creating your history"
        render action: :new
      end
  	end

  def edit
  	# @history = History.find(params[:id])

  end

def update
	@history = History.find(params[:id])
	if @history.update_attributes(history_params)
  		flash[:success] = "Saved history."
  		redirect_to history_path
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
  	redirect_to history_index_path
  end


    private
    def set_history
      @history = current_user.histories.find(params[:id])
    end

    def history_params
    	params.require(:history).permit(:user_id, :updated_at)
  	end

  	
end
