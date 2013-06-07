require_relative 'player'

class HumanPlayer < Player

def choose_move(board)
  print "Choose where you want to go [0,1,2,3,4,5,6,7,8] > "
  chosen_position = gets
end

end