require 'rspec'
require 'towers'

describe Towers do
  subject(:towers) { Towers.new }
  describe "#initialize" do
    it "starts with three arrays" do
      expect(towers.arrays.count).to eq(3)
    end

    it "the first tower should have 3 disks" do
      expect(towers.arrays.first).to eq([:disk3, :disk2, :disk1])

    end

    it "the second and third towers should be empty"do
      expect(towers.arrays[1]).to be_empty
      expect(towers.arrays[2]).to be_empty
    end
  end

  describe "#moves" do
    let(:input) {[0,1]}

    #
    # it "calls the get_input function" do
    #   expect(towers).to receive(:get_input)
    #   towers.moves
    # end

    it "should manipulate the towers according to the array"  do
      allow(towers).to receive(:get_input).and_return([0,1])
      towers.moves
      expect(towers.arrays).to eq([[:disk3,:disk2],[:disk1],[]])
    end

    it "should manipulate the towers according to the array"  do
      towers.arrays = [[:disk1],[:disk2],[:disk3]]
      allow(towers).to receive(:get_input).and_return([2,1])
      towers.moves
      expect(towers.arrays).to eq([[:disk1],[:disk2],[:disk3]])
    end


    it "should check if a valid move" do
      expect(towers).to receive(:valid_move?)
      towers.moves
    end

  end

  describe "#get_input" do
    it "calls the get function" do
      expect(towers).to receive(:gets)
      towers.get_input
    end

    it "returns an array" do
      expect(towers.get_input.class).to be(Array)
    end
  end

  describe "#valid_move?" do
    subject(:towers) { Towers.new }
    let (:input) {[1,2]}
    it "input array is not empty" do
      towers.arrays = [[],[],[]]
      expect(towers.valid_move?(input)).to be(false)
    end

    it "input top disk is smaller than output top disk" do
      towers.arrays = [[:disk1],[:disk3],[:disk2]]
      expect(towers.valid_move?(input)).to be(false)
    end

  end


  describe "#play" do
    it "should call #move" do
        expect(towers).to receive(:moves)
        towers.play
    end
    it "should continue until the won condition" do
      expect(towers).to receive(:won)
      towers.play
    end

    it "should print a win message if won" do
      expect(towers).to receive(:puts, :print)
      towers.play
    end
  end

  describe "#won" do
    subject (:towers) {Towers.new}
    it "return should the first array to make sure its empty" do
      towers.arrays = [[][:disk3, :disk2, :disk1][]]
      expect(towers.arrays.first.empty?).to be(true)
    end

    it "should return true if first array is empty and any other tower is full" do
      towers.arrays = [[][:disk3, :disk2, :disk1][]]
      expect(towers.won).to eq(true)
    end

    it "should return false if first array is empty and any other tower is full" do
      towers.arrays = [[][:disk3, :disk2][:disk1]]
      expect(towers.won).to eq(false)
    end

  end
end
