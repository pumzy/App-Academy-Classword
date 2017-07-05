# require "enumerable"
class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @head.prev = nil
    @tail.next = nil
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    checker = @head
    until checker == @tail
      if checker.key == key
        return checker.val
      end
      checker = checker.next
    end
    nil
  end

  def include?(key)
    checker = @head
    until checker == @tail
      if checker.key == key
        return true
      end
      checker = checker.next
    end
    false
  end

  def append(key, val)
    new_link = Link.new(key, val)
    new_link.prev = last
    new_link.next = @tail
    last.next = new_link
    @tail.prev = new_link
  end

  def update(key, val)
    checker = @head
    until checker == @tail
      if checker.key == key
        checker.val = val
      end

      checker = checker.next
    end
  end

  def remove(key)
    checker = @head
    until checker == @tail
      if checker.key == key
        checker.prev.next = checker.next
        checker.next.prev = checker.prev
      end
      checker = checker.next
    end
  end

  def each(&blk)
    checker = first
    until checker == @tail
      blk.call(checker)
      checker = checker.next
    end
  end


  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
