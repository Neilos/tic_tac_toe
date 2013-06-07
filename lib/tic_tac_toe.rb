
class TicTacToe
attr_reader :board



CROSSES = "X"
NOUGHTS = "0"

def initialize(board_string)
  raise RuntimeError unless board_string.size == 9
  @board = board_string.split('')
end

def to_s
  string = ""
  board.each_with_index do |c, i|
    string << "\n" if i % 3 ==0
    string << "|" if (i % 3 == 1) || (i % 3 == 2)
    string << " " << c << " "
  end
  string
end

# def finished?
# end

# def next_move
# end

# def next_player
# end

def valid?
  diff_between(count_of("X"), count_of("0")) <= 1
end


#########
# private
#########

def diff_between(val1, val2)
  (val1 - val2).abs
end

def count_of(mark)
  board.count(mark)
end




end