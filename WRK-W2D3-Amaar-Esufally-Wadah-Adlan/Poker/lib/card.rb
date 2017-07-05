class Card
  attr_accessor :value, :suit

  SUITS = {:spades => "\u2660", :hearts =>"\u2661", :diamonds => "\u2662" ,:clubs => "\u2663"}
  VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)

  def initialize(value, suit)
    raise InvalidCard if SUITS.has_key?(suit) == false
    raise InvalidCard if !VALUES.include?(value)
     @value = value
     @suit = SUITS[suit]
   end

end

class InvalidCard < StandardError
  print "INVALID CARD"
end
