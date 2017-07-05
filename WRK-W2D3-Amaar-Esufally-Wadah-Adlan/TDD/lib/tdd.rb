class Array

  def my_uniq
    new_arr = []
    length.times do |i|
      new_arr << self[i] unless new_arr.include?(self[i])
    end
    new_arr
  end


  def two_sums
    new_arr = []
    length.times do |i|
      length.times do |j|
        next if i == j
        new_arr << [i,j] if self[i] + self[j] == 0 unless new_arr.include?([j,i])
      end
    end
    new_arr
  end

  def my_transpose
    new_arr = []
    i = 0
    until i == length
      sub_arr = []
      each do |j|
        sub_arr << j[i]
      end
      new_arr << sub_arr
      i += 1
    end
    new_arr
  end

  def stock_picker
    profit = 0
    arr = []
    length.times do |i|
      length.times do |j|
        next if j < i
        if self[j] - self[i] > profit
          profit = self[j] - self[i]
          arr = []
          arr << i
          arr << j
        end
      end
    end
    arr
  end

  def 
end
