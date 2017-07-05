require 'rspec'
require 'tdd'

describe "#my_uniq" do

  subject (:arr) {[1,2,3,4,4,4,5,6,4]}
  it "should remove all duplicates" do
    expect(arr.my_uniq).to eq([1,2,3,4,5,6])
  end

  it "should not modify the original array" do
    expect(arr.my_uniq).not_to be(arr)
  end
end

describe "#two_sums" do
  subject (:arr) {[-1,0,2,-2,1]}
  let (:cat) {[0,3,7,-7,3,-3]}
  it "should find all pairs" do
    expect(arr.two_sums).to eq([[0,4],[2,3]])
  end

  it "should return smaller indexes before bigger ones" do
    expect(cat.two_sums).to eq([[1,5],[2,3],[4,5]])
  end

end

describe "#my_transpose" do
  subject(:arr) { [[1,2,3],[4,5,6],[7,8,9]] }

  it "should switch rows and columns" do
    expect(arr.my_transpose).to eq([[1,4,7],[2,5,8],[3,6,9]])
  end
  it "should not modify the original array" do
    expect(arr.my_transpose).not_to be(arr)
  end

  describe "#stock_picker" do
    subject (:arr) {[3,4,5,2,3,42,15,9,1]}
      it "should return days in order" do
        expect(arr.stock_picker).to_not eq([8,5])
      end


      it "would return the highest pair day" do
        expect(arr.stock_picker).to eq([3,5])
      end
  end

end
