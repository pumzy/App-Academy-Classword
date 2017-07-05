require_relative "deck.rb"

class Hand

  def initialize(deck)
    @deck = deck
    @hand = []
  end

  HAND_COMPARE = [
    pair, two_pair,
    triples, straight,
    flush, full_house,
    four_of_a_kind, straight_flush,
    royal_flush
      ]

  def pair_count
    paircount = Hash.new { |hash, key| hash[key] = 0 }
    a = hand.hand.map do |card|
      card.value
    end

    a.each do |value|
      next if paircount.has_key?(value)
      if a.count(value) == 2
        paircount[value] += 1
      end
    end
    paircount.keys
  end

  def pairs
    hsh = self.pair_count
    arr.count == 1 ? hsh : nil
  end

    # paircount = Hash.new { |hash, key| hash[key] = 0 }
    # a = hand.hand.map do |card|
    #   card.value
    # end
    #
    # a.each do |value|
    #   next if paircount.has_key?(value)
    #   if a.count(value) == 2
    #     paircount[value] += 1
    #   end
    # end
    # paircount.keys
  end
  def two_pair
    arr = self.pair_count
    arr.count == 2 ? arr : nil
  end

  def trips
    trips_count = Hash.new { |hash, key| hash[key] = 0 }
    a = hand.hand.map do |card|
      card.value
    end

    a.each do |value|
      next if trips_count.has_key?(value)
      if a.count(value) == 3
        trips_count[value] += 1
      end
    end
    trips_count.keys
  end

  def fours
    four_of_a_kind = Hash.new { |hash, key| hash[key] = 0 }
    a = hand.hand.map do |card|
      card.value
    end

    a.each do |value|
      next if four_of_a_kind.has_key?(value)
      if a.count(value) == 4
        four_of_a_kind[value] += 1
      end
    end
    four_of_a_kind.keys
  end

  def flushes

  end

  def full_house
    if pairs.count == 1 && trips.count == 1
      return @hand.map {|card| card.value}
    end
  end


  def flush?
    unless @hand.all {|card| card.suit == @hand[0].suit}
      return false
    end
    true
  end

  def flush
    unless flush?
      return false
    end
    topnum = ""
    VALUES.each do |val|
      hand.each do |card|
        if card.value == val
          topnum = val
        end
      end
    end
    return VALUES.index(topnum)
  end

  def royal_flush
    return false unless flush?

    arr = @hand.map {|card| card.value}
    arr2 = arr.map {|card| VALUES.index(card)}
    return true if arr2.min == 8
    false
  end
end 
