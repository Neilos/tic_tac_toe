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
    lines(board).any?{|line| line.uniq.count==1 and line.first!= SPACE }
  end

  def next_move!
    move = get_move_from next_player
    @board[move] = next_player.mark 
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

  def game_over?
    finished? || board.count(SPACE) == 0
  end

  def winner
    next_player == player1 ? player2 : player1
  end

  def play!
    until game_over?
      print game_table + "\n\n"
      next_move!
      print "Player #{next_player}'s turn.\n----------------------------\n"
    end
    puts finished? ? game_table + "\nPLAYER #{winner} IS THE WINNER\n----------------------------\n" : game_table + "\nIT'S A DRAW\n----------------------------\n"
  end

  def game_table
    string = "\n"
    board.each_with_index do |c, i|
      string << "\n-----------\n" if i % 3 ==0 && i != 0
      string << "|" if (i % 3 == 1) || (i % 3 == 2)
      string << " " << c << " "
    end
    string
  end


##########
private

  def get_move_from(player)
    move = player.choose_move(board).to_i
    until valid_move?(move)
      print "Invalid move! Choose an empty postion (0,1,2,3,4,5,6,7,8): "
      move = player.choose_move(board).to_i
    end
    move
  end

  def valid_move?(move)
    board[move] == " " && [0,1,2,3,4,5,6,7,8].include?(move)
  end

  def difference_between(things)
    (things[:this] - things[:that]).abs
  end

  def count(stuff)
    stuff[:within].count(stuff[:of])
  end

end