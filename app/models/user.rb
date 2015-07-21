class User < ActiveRecord::Base
	has_many :workouts
	has_many :histories
end
