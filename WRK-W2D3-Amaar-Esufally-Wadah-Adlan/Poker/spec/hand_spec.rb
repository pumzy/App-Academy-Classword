require 'rspec'
require 'hand'

describe Hand do
  subject(:hand) {Hand.new}
  describe "#initialize" do
    it "should have 5 cards" do
      expect(hand.hand.count).to eq(5)
    end
    it "should not contain doubles" do
      expect(hand.hand.uniq).to eq(hand.hand)
    end
  end
end
