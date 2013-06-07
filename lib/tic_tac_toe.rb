require_relative 'player'
require_relative 'line_aware'

class TicTacToe
include LineAware
attr_reader :board, :player1, :player2

CROSS = "X"
NOUGHT = "0"
SPACE = " "

def initialize(board_string, cross_player, nought_player)
  raise RuntimeError unless board_string.size == 9
  @board = board_string.split('')
  @player1 = cross_player
  @player1.mark = CROSS
  @player2 = nought_player
  @player2.mark = NOUGHT
end


def finished?
  lines(board).any?{|line| line.uniq.count==1 and line.first!=SPACE }
end

def next_move!
  player = next_player
  move = get_move(player)
  @board[move] = player.mark 
end

def next_player
  count(of:"X", within: board) > count(of: "0", within: board) ? @player2 : @player1
end

def valid?
  difference_between(:this => count(of: "X", within: board), 
                     :that => count(of: "0", within: board)) <= 1
end

def to_s
  board.join
end

def print
  string = ""
  board.each_with_index do |c, i|
    string << "\n" if i % 3 ==0
    string << "|" if (i % 3 == 1) || (i % 3 == 2)
    string << " " << c << " "
  end
  string
end


#########
# private
#########

def get_move(player)
  move = player.choose_move(board)
  raise(RuntimeError, "Move must be in an empty space") unless @board[move] == SPACE
  move
end

def difference_between(things)
  (things[:this] - things[:that]).abs
end

def count(stuff)
  stuff[:within].count(stuff[:of])
end

end