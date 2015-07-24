class Card

  attr_accessor :number, :suit, :value

  def initialize(value, suit, number)
    @number = number
    @suit = suit
    @value = value
  end
 
  def to_s
    "#{@number} of #{@suit}"
  end
end


