require_relative 'card'

class Deck
  attr_reader :cards

  SUITS = [:spades, :hearts, :clubs, :diamonds]
  VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)


  def initialize
    @cards = []
    SUITS.each do |suit|
      VALUES.each do |value|
        @cards << Card.new(value, suit)
      end
    end
    @cards.shuffle
  end

  def shuffle!
    cards.shuffle!
  end



end
