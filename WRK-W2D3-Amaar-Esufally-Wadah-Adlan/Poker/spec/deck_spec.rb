require 'rspec'
require 'deck'


describe Deck do

  subject (:deck) {Deck.new}
  describe "#initialize" do
    let(:initial_cards) {deck.dup}
    it "cards should be stored in an array" do
      expect(deck.cards.class).to be(Array)
    end

    it "its length size should be 52 elements" do
      expect(deck.cards.count).to eq(52)
    end

    it "checks to see if the deck is shuffled" do
      expect(deck.shuffle!).not_to eq(initial_cards)
    end

  end




end
