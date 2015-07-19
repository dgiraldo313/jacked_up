class CardDeck < ActiveRecord::Base
	belongs_to :workout
	has_many :cards
end
