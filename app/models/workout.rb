class Workout < ActiveRecord::Base
	belongs_to :user
	has_many :card_decks

	validates :hearts, presence: true
	validates :clubs, presence: true
	validates :spades, presence: true
	validates :diamonds, presence: true

end
