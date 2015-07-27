class Card

  attr_accessor :value, :suit, :rank

  def initialize(rank, suit, value)
    @value = value
    @suit = suit
    @rank = rank
  end
 
  def to_s
    "#{@value} of #{@suit}"
  end
end


