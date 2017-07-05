

def my_min_p1(arr)
  min = arr.first
  arr.each do |x|
    arr.each do |y|
      x <= y ? el = x : el = y
      el < min ? min = el : min
    end
  end
  min
end

def my_min_p2(arr)
  min = arr.first
  arr.each do |el|
    min = el if el < min
  end
  min
end

def lcs_p1(arr)
  subsets = Hash.new

  arr.each_index do |index|
    second_index = index
    while second_index < arr.length
      subset = arr[index..second_index]
      subsets[subset.reduce(:+)] = subset
      second_index += 1
    end
  end

  subsets.keys.max
end

def lcs_p2(arr)
  result = arr.first
  sum = arr.first
  arr[1..-1].each do |val|
    sum = 0 if sum < 0
    sum += val
    result = sum if sum > result
  end
  result
end

def first_anagram(string, target)
  characters = string.chars
  all = characters.permutation
  anagrams = all.map { |arr| arr.join('') }
  anagrams.include?(target)
end


def second_anagram(string, target)
  first = string.chars
  first.each do |letter|
    if string.include?(letter) && target.include?(letter)
      string.sub!(letter,"")
      target.sub!(letter,"")
    end
  end
  string.empty? && target.empty?
end

def third_anagram?(string,target)
  string.chars.sort == target.chars.sort
end

def fourth_anagram(string, target)
  target_hash = Hash.new(0)
  string_hash = Hash.new(0)
  string.chars.each do |letter|
    string_hash[letter] += 1
  end
  target.chars.each do |letter|
    target_hash[letter] += 1
  end
  target_hash == string_hash
end

def fifth_anagram(string, target)
  hash =  Hash.new(0)
  string.chars.each do |letter|
    hash[letter] += 1
  end
  target.chars.each do |letter|
    hash[letter] -= 1
  end

  hash.values.all? {|val| val == 0}
end

def bad_two_sum?(arr,target)
  arr.each_with_index do |el1, i|
    arr.each_with_index do |el2, j|
      return true if el2 + el1 == target && i != j
    end
  end
  false
end


def okay_two_sum?(arr, target)
  arr.sort!
  arr.each_with_index do |el,index|
    targ = target-el
    search = bsearch(arr,targ)
    next if search == index
    unless search.nil?
      return true
    end
  end
  false
end


def bsearch(array, target)
  return nil if array.empty?
  mid = array.length/2
  # return mid if array[mid] == target

  left = array[0...mid]
  right = array[mid+1..-1]

  if array[mid] == target
    return mid
  elsif target < array[mid]
    bsearch(left, target)
  else
    search = bsearch(right, target)
    search.nil? ? nil :  search + mid + 1
  end
end

def two_sum?(array,target)
  big_gun = Hash.new(0)
  array.each do |ammo|
    big_gun[ammo] += (target-ammo)
  end
  big_gun.each do |k,v|
    return true if big_gun.include?(v)
  end
  false
end


def windowed_max_range(array,size)
  current_max_range = 0
  array.each_cons(size) do |arr|
    range = arr.max - arr.min
    current_max_range = range if range > current_max_range
  end
  current_max_range
end

class MyQueue
  def initialize
    @store = []
  end

  def enqueue(thing)
    @store << thing
  end

  def dequeue
    @store.shift
  end

  def peek
    @store[0]
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end


class MyStack
  def initialize
    @store = []
    @dup = @store
    @metadata = []
  end

  def populate_metadata
    size.times do
      @metadata[@dup.pop] = true
    end

  end

  def push(thing)
    @store << thing
  end

  def pop(arg = 1)
    @store.pop(arg)
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def max
    # @store.max
    @metadata.size
  end


end

class StackQueue
  def initialize
    @store = Mystack.new
    @dump = MyStack.new
  end

  def enqueue(thing)
    @store.push(thing)
  end

  def dequeue
    length = @store.size - 1
    @dump << (@store.pop(length))
    result = @store.pop
    @store = @dump
    @dump = []
    result

    # length.times do
    #   @dump.push(@store.pop)
    # end
    # result = @store.pop
    # @store = @dump
    # @dump = []
    # result
  end

  def peek
    length = @store.size - 1
    @dump << (@store.pop(length))
    result = @store.pop
    @store = [result] + @dump
    @dump = []
    result
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end





def omr(array,size)
