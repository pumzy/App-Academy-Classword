class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    val = 0
    self.each_with_index do |el, i|
      val = val ^ el.hash + i
    end
    val
  end
end

class String
  def hash
    arr = self.chars.map(&:ord)
    arr.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    val = 0
    self.each do |k, v|
      val = val ^ k.hash ^ v.hash
    end
    val
  end
end
