class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
    	t.belongs_to :user

      t.timestamps :created_at, :updated_at
    end
  end
end
