require 'rspec'
require 'card'

describe Card do
  describe "#initialize" do
    let (:value) {10}
    let (:suit) {"rack"}
    subject (:card) {Card.new("5", :hearts)}
    it "should create a new card" do
      expect(card.class).to eq(Card)
    end

    it "each card should have a value" do
      expect(card.value).not_to eq(nil)
    end

    it "each card should have a suit" do
      expect(card.suit).not_to eq(nil)
    end

    it "should raise an error if the suit call is not a suit" do

      expect {Card.new("10",suit)}.to raise_error(InvalidCard)
    end

    it "raise an error if the value is not in the given range" do

      expect {Card.new(value,"♥")}.to raise_error(InvalidCard)
    end


  end
end
