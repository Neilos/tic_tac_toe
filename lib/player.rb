require_relative 'line_aware'

class Player
include LineAware

attr_accessor :mark
  def initialize
    @mark = " "
  end

  def choose_move(board)
    6
  end

end