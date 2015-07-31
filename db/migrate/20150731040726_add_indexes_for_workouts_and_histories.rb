class AddIndexesForWorkoutsAndHistories < ActiveRecord::Migration
  def change
  	add_index :workouts, :user_id
  	add_index :histories, :user_id
  end
end
