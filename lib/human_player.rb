require_relative 'player'

class HumanPlayer < Player
  def choose_move(board)
    print "You are player #{self.to_s} (You are #{self.mark}'s).\nEnter your move (0,1,2,3,4,5,6,7,8): "
    gets.to_i
  end
end
