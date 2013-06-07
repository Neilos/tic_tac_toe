require_relative 'player'

class TicTacToe
attr_reader :board, :player1, :player2

LINE_INDEXES = [
  # backslash
  [2,4,6],
  # forwardslash
  [0,4,8],
  # columns
  [0,3,6],[1,4,7],[2,5,8],
  # rows
  [0,1,2],[3,4,5],[6,7,8]
]

CROSS = "X"
NOUGHT = "0"
SPACE = " "

def initialize(board_string)
  raise RuntimeError unless board_string.size == 9
  @board = board_string.split('')
  @player1 = Player.new(CROSS)
  @player2 = Player.new(NOUGHT)
end


def finished?
  lines.any?{|line| line.uniq.count==1 and line.first!=SPACE }
end

def next_move
end

def next_player
  count(of:"X", within: board) > count(of: "0", within: board) ? @player2 : @player1
end

def valid?
  difference_between(:this => count(of: "X", within: board),
                     :that => count(of: "0", within: board)) <= 1
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


#########
# private
#########


def difference_between(things)
  (things[:this] - things[:that]).abs
end

def count(stuff)
  stuff[:within].count(stuff[:of])
end

def lines
  LINE_INDEXES.map{ |line| line.map{ |index| @board[index] } }
end

end