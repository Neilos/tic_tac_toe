require_relative 'line_aware'
require_relative 'tic_tac_toe'

class Player
include LineAware

attr_accessor :mark
  def initialize
    @mark = " "
  end

  def choose_move(board)
    return empty_positions_in_lines_matching([mark,mark," "], board).first unless empty_positions_in_lines_matching([mark,mark," "], board) == []
  end

private

  def winning_move
  end

end