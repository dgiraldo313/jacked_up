class Workout < ActiveRecord::Base
	belongs_to :user
	has_many :card_decks
end
