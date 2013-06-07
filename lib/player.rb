require_relative 'line_aware'
require_relative 'tic_tac_toe'

class Player
include LineAware

attr_accessor :mark
  def initialize
    @mark = " "
  end

  def choose_move(board)
    return winning_move(board) if winning_move(board)
    return blocking_move(board) if blocking_move(board)
    return progressive_move(board) if progressive_move(board)
    return free_move(board) if free_move(board)
    raise RuntimeError, "Can't go."
  end

  def to_s
    mark == TicTacToe::NOUGHT ? "2" : "1"
  end

private

  def winning_move(board)
    winning_move = empty_positions_in_lines_matching([mark,mark,TicTacToe::SPACE], board).first unless 
    winning_move == [] ? nil : winning_move
  end

  def blocking_move(board)
    blocking_move = empty_positions_in_lines_matching([other_player_mark,other_player_mark,TicTacToe::SPACE], board).first 
     blocking_move == [] ? nil : blocking_move
  end

  def progressive_move(board)
    progressive_move = empty_positions_in_lines_matching([mark,TicTacToe::SPACE,TicTacToe::SPACE], board).first 
     progressive_move == [] ? nil : progressive_move
  end

  def free_move(board)
    free_move = empty_positions_in_lines_matching([TicTacToe::SPACE,TicTacToe::SPACE,TicTacToe::SPACE], board).first 
     free_move == [] ? nil : free_move
  end

  def other_player_mark
    mark == TicTacToe::NOUGHT ? TicTacToe::CROSS : TicTacToe::NOUGHT
  end

end