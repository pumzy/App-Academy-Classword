require_relative 'p02_hashing'

class HashSet
  attr_reader :count
  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    # debugger
    resize! if count == @store.length
    self[num] << num
    @count += 1
    # debugger
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    n = num.hash%num_buckets
    @store[n]
  end

  def num_buckets
    @store.length
  end

  def resize!
    array = @store.flatten
    @store = Array.new(num_buckets * 2) { Array.new }
    array.each do |el|
      self[el] << el
    end
  end
end
