class AddFieldsToWorkouts < ActiveRecord::Migration
  def change
  		add_column :workouts, :spades, :string
  		add_column :workouts, :hearts, :string
  		add_column :workouts, :clubs, :string
  		add_column :workouts, :diamonds, :string
  end
end
