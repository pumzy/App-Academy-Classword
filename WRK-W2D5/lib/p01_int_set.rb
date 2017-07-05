require 'byebug'
class MaxIntSet

  def initialize(max)
    @max = max
    @store = Array.new(max,false)
  end

  def insert(num)
    raise ("Out of bounds") unless is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    raise ("Out of bounds") unless is_valid?(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] 
  end

  private

  def is_valid?(num)
    return false if num >= @max
    return false if num < 0
    true
  end

  def validate!(num)

  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    n = num%num_buckets
    @store[n]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
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
    n = num%num_buckets
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
