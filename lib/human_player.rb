require_relative 'player'

class HumanPlayer < Player

def choose_move(board)
  print "Enter your move (0,1,2,3,4,5,6,7,8): "
  gets
end

end