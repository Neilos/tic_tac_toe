require_relative 'line_aware'
require_relative 'tic_tac_toe'

class Player
include LineAware

attr_accessor :mark
  def initialize
    @mark = " "
  end

  def choose_move(board)
    # && lines_containing(board, " ") && lines_containing(board, @mark)
    6
  end

end