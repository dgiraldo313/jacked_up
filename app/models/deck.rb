class Deck
	def initialize
		@cards = []
		ranks = %w{ A 2 3 4 5 6 7 8 9 10 J Q K}
		suits = %w{Spades Hearts Diamonds Clubs}

		
		suits.each do |suit|
			(ranks.size).times do |i|
				value= i+1
				rank= ranks[i]
				if rank == "A" || rank == "J" || rank == "Q" || rank == "K" 
					value= 10;
				end
				@cards.push(Card.new(ranks[i], suit, value))
				i+=1
			end
		@cards.shuffle!
		end
	end
	
	def shuffle!
		@cards.shuffle!
	end
	
	def draw
		@cards.pop
	end
	
	def remaining
		@cards.length
	end

	def cards
		@cards
	end

end