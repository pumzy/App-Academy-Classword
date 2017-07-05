class Towers

  attr_accessor :arrays
  def initialize
    @arrays = [[:disk3,:disk2,:disk1],[],[]]
  end

VALUES = { :disk3 => 3, :disk2 => 2, :disk1 => 1}

  def get_input
    print "Please enter an input"
    input = gets.chomp
    print "Now enter an output"
    output = gets.chomp
    [input.to_i, output.to_i]
  end

  def play
    print arrays
    print "\n"
    until won
      moves
    end
    puts "Congrats you won"
  end


  def won
    if arrays.first.empty?
      arrays[1..-1].each do |arr|
        a = arr.map {|disk| VALUES[disk]}
        return true if a == a.sort.reverse && a.length == 3
      end
    end
    false
  end

  def moves
    x, y  = get_input
    arrays[y] << arrays[x].pop if valid_move?([x,y])
    print arrays
  end

  def valid_move?(array)
    x, y = array
    return false if arrays[x].empty?
    return false if VALUES[arrays[x].last] > VALUES[arrays[y].last] unless arrays[y].empty?
    true
  end



end

if __FILE__ == $PROGRAM_NAME
  game = Towers.new
  game.play
end
